class DisplayController < ApplicationController
  def see_class
    if params[:seeClass] != 'No Classes'
      @class_number = params[:seeClass]
      @class_number.slice!'Class '
      cookies[:seeClass] = @class_number
    end
    redirect_to '/'
  end

  def pair
    @student_ids = []
    @pair_results = []
    @students_to_pair = Student.where(class_number: cookies[:seeClass])
    if !@students_to_pair.nil?
      @students_to_pair.each {|student|
        @student_ids << student.id
      }
    end
    @pairs_bad = true
    while @pairs_bad
      @pairs_bad = false
      randomized_ids = form_pairs
    end

    randomized_ids.each {|count|
      @pair_results << "#{Student.find(count).first_name} #{Student.find(count).last_name}"
    }
    cookies[:pair_results] = @pair_results.to_yaml
    @paired_class = cookies[:seeClass].to_i
    cookies[:paired_class] = @paired_class
    redirect_to '/'
  end

  def form_pairs
    if Pair.where(:class_number => @paired_class).maximum('pair_set').nil?
      set_number = 1
    else
      set_number = Pair.where(:class_number => @paired_class).maximum('pair_set') + 1
    end

    count = 0
    randomized = @student_ids.sample(@student_ids.length)
    while count < randomized.length do
      if !Pair.where(:first_id => [randomized[count], randomized[count+1]], :second_id => [randomized[count], randomized[count+1]]).first.nil?
        @pairs_bad = true
      end
      count += 2
    end
    count = 0
    if !@pairs_bad
      while count < randomized.length do
        Pair.create(class_number: cookies[:seeClass].to_i, pair_set: set_number, first_id: randomized[count], second_id: randomized[count+1], first_full_name: "#{Student.find(randomized[count]).first_name} #{Student.find(randomized[count]).last_name}", second_full_name: "#{Student.find(randomized[count+1]).first_name} #{Student.find(randomized[count+1]).last_name}")
        count += 2
      end
    end
    randomized
  end
end
