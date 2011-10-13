require 'spec_helper'

describe UsersController do
    before :each do
      login
      @user = User.create(:email => "user@usuarios.com.br", :password => "123456")
    end

    it "deveria apresentar a tela novo user" do
      get :new
      response.should be_success
      assigns(:user).should_not be_nil
    end

    it "deveria criar um user" do
      post :create, :user => {:email => 'fabricioraphael.b@gmail.com', :password => '123456'}
      should redirect_to :controller => :profiles, :action => :new

      assigns(:user).should_not be_nil
      assigns(:user).errors.should be_blank
    end

    it "deveria renderizar a tela de new quando acontecer erro" do
      post :create, :user => {:password => ""}
      response.should render_template(:new)

      assigns(:user).errors.should_not be_nil
    end
 
    it "deveria apresentar a listagem de usuários" do
      get :index
      response.should be_success
      assigns(:users).should_not be_nil
    end
 
    it "deveria mostrar a tela de edição de usuários" do
      get :edit, :id => @user.id
      response.should be_success
      assigns(:user).should_not be_nil
    end

    it "deveria alterar um usuários" do
      put :update, :user => {:email => "user@alterado.com.br"}, :id => @user.id
      # should respond_with :redirect
      should redirect_to :action => :index
  
      assigns(:user).email.should == 'user@alterado.com.br'
    end
  
    it "deveria renderizar a tela de edit quando acontecer erro" do
      put :update, :user => {:email => ""}, :id => @user.id
      response.should  render_template(:edit)
  
      assigns(:user).errors.should_not be_nil
    end
end
