class ManagerController < ApplicationController
  def add_student
    @new_student = Student.new
    @new_student.first_name = params[:firstName].strip
    @new_student.last_name = params[:lastName].strip
    @new_student.class_number = params[:classNumber]
    @new_student.save
    redirect_to '/'
  end

  def delete
    @delete_this = Student.find_by_first_name_and_last_name(params[:displayedFirstName], params[:displayedLastName])
    @delete_this.destroy
    redirect_to '/'
  end

  def delete_pair
    @delete_this = Pair.find_by_first_id_and_second_id(params[:displayedFirstId], params[:displayedSecondId])
    @delete_this.destroy
    redirect_to '/'
  end
end
