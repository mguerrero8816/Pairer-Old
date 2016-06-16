class LandingController < ApplicationController
  def land
    seeClass
  end

  def seeClass
    @class_number = cookies[:seeClass]
    @class_students = Student.where('class_number = ?', @class_number)
  end
end
