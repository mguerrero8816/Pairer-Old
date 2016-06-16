class DisplayController < ApplicationController
  def see_class
    @class_number = params[:seeClass]
    @class_number.slice!'Class '
    @class_students = Student.where('class_number = ?', @class_number)
    render '/landing/land.html.erb'
  end
end
