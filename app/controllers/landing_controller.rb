class LandingController < ApplicationController
  def land
    seeClass
    seeOldPairs
    @pair_results = YAML.load(cookies[:pair_results])
  end

  def seeClass
    @class_number = cookies[:seeClass]
    @class_students = Student.where('class_number = ?', @class_number)
  end

  def seeOldPairs
    @class_number = cookies[:seeClass]
    @student_pairs = Pair.where('class_number = ?', @class_number)
  end
end
