class LandingController < ApplicationController
  def land
  end

  def see_class
    @class_number = params[:seeClass]
    @class_students = Students.where('class_number = ?', @class_number)
    redirect_to '/'
  end
end
