require 'spec_helper'

describe ProfilesController do
   before :each do
      login
      @user = User.create(:email => "user@usuarios.com.br", :password => "123456")
      @profile = Profile.create(:nome => "Fabricio Raphael", :nascimento => "11/09/1991", :endereco => "QND 60 casa 05", :web_site => "www.google.com.br",
                                :bio => "Computer programmer", :user => @user)
   end

   it "deveria apresentar a tela novo profile" do
     get :new
     response.should be_success
     assigns(:profile).should_not be_nil
   end

   it "deveria criar um profile" do
     post :create, :profile => {:nome => "Fabricio Raphael", :nascimento => "11/09/1991", :endereco => "QND 60 casa 05", :web_site => "www.google.com.br",
                                :bio => "Computer programmer"}
     should redirect_to :controller => :posts, :action => :index
     # assigns(:profile).should_not be_nil
     assigns(:profile).errors.should be_blank
   end

   it "deveria renderizar a tela de new quando acontecer erro" do
     post :create, :profile => {:nome => ""}
     response.should render_template(:new)
   
     assigns(:profile).errors.should_not be_nil
   end
    
    
   it "deveria mostrar a tela de edição de profile" do
     get :edit, :id => @profile.id
     response.should be_success
     assigns(:profile).should_not be_nil
   end
   
   it "deveria alterar um profile" do
      put :update, :profile => {:nome => "Fabricio Alterado"}, :id => @profile.id
      # should respond_with :redirect
      should redirect_to :controller => :posts, :action => :index  
          
      assigns(:profile).nome.should == "Fabricio Alterado"
    end
     
   it "deveria renderizar a tela de edit quando acontecer erro" do
     put :update, :profile => {:nome => ""}, :id => @profile.id
     response.should  render_template(:edit)
     
     assigns(:profile).errors.should_not be_nil
   end
   
   it "deveria apresentar dados da profile" do
     get :show, :id => @profile.id
     response.should be_success
     response.should render_template(:show)
     assigns(:profile).should_not be_nil
   end

end
