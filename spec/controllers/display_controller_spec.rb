require 'rails_helper'

RSpec.describe DisplayController, type: :controller do

  describe "GET #see_class" do
    it "returns http success" do
      get :see_class
      expect(response).to have_http_status(:success)
    end
  end

end
