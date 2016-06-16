class DisplayController < ApplicationController
  def see_class
    @class_number = params[:seeClass]
    @class_number.slice!'Class '
    cookies[:seeClass] = @class_number
    redirect_to '/'
  end
end
