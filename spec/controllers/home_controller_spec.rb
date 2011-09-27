require 'spec_helper'

describe HomeController do
  before :each do
    login
  end
   it "deveria apresentar a listagem de post" do
     get :index
     response.should be_success
     assigns(:posts).should_not be_nil
   end
    
end
