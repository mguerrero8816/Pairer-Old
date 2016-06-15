class ManagerController < ApplicationController
  def add_student
    @new_student = Student.new
    @new_student.first_name = params[:firstName]
    @new_student.last_name = params[:lastName]
    @new_student.class_number = params[:classNumber]
    @new_student.save
    redirect_to '/'
  end
end
