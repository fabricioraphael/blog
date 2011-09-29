require 'spec_helper'

describe ProfilesController do
   before :each do
      login
      @profile = Profile.create(:nome => "Fabricio Raphael", :nascimento => "11/09/1991", :endereco => "QND 60 casa 05", :web_site => "www.google.com.br",
                                :bio => "Computer programmer")
   end

   it "deveria apresentar a tela novo profile" do
     get :new
     response.should be_success
     assigns(:profile).should_not be_nil
   end

   # it "deveria criar um profile" do
   #   post :create, :profile => {:nome => "Fabricio Raphael", :nascimento => "11/09/1991", :endereco => "QND 60 casa 05", :web_site => "www.google.com.br",
   #                              :bio => "Computer programmer"}
   #   should redirect_to :controller => :home, :action => :index
   #   # assigns(:profile).should_not be_nil
   #   assigns(:profile).errors.should be_blank
   # end
   # 
   # it "deveria renderizar a tela de new quando acontecer erro" do
   #   post :create, :user => {:password => ""}
   #   response.should render_template(:new)
   # 
   #   assigns(:user).errors.should_not be_nil
   # end
   #  
   # # it "deveria apresentar a listagem de usuários" do
   # #   get :index
   # #   response.should be_success
   # #   assigns(:users).should_not be_nil
   # # end
   #  
   # it "deveria mostrar a tela de edição de usuários" do
   #   get :edit, :id => @user.id
   #   response.should be_success
   #   assigns(:user).should_not be_nil
   # end
   # 
   # it "deveria alterar um usuários" do
   #   put :update, :user => {:email => "user@alterado.com.br"}, :id => @user.id
   #   # should respond_with :redirect
   #   should redirect_to :controller => :home, :action => :index
   #   
   #   assigns(:user).email.should == 'user@alterado.com.br'
   # end
   #   
   # it "deveria renderizar a tela de edit quando acontecer erro" do
   #   put :update, :user => {:email => ""}, :id => @user.id
   #   response.should  render_template(:edit)
   #   
   #   assigns(:user).errors.should_not be_nil
   # end

end
