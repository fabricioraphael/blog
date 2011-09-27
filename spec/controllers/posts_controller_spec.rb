require 'spec_helper'

describe PostsController do
  
  before :each do
    login
    @post = Post.create(:titulo => "Titulo", :corpo => "Corpo do post")
  end
  
  it "deveria apresentar o new post" do
    get :new
    response.should be_success
    assigns(:post).should_not be_nil
  end

  it "deveria criar um post" do
    post :create, :post => {:titulo => "Titulo", :corpo => "Corpo do post"}
    # should respond_with :redirect
    should redirect_to :controller => :home, :action => :index
        
    assigns(:post).errors.should be_blank
  end
  
  it "deveria renderizar a tela de new quando acontecer erro" do
     post :create, :post => {:titulo => "Titulo"}
     response.should render_template(:new)
     
     assigns(:post).errors.should_not be_nil
   end
  
  it "deveria apresentar show de post" do
    get :show, :id => @post.id
    response.should be_success
    response.should render_template(:show)
    assigns(:post).should_not be_nil
  end
  
  it "deveria mostrar a tela de edição de post" do
    get :edit, :id => @post.id
    response.should be_success
    assigns(:post).should_not be_nil
  end
  
  it "deveria alterar um post" do
        put :update, :post => {:titulo => "Titulo"}, :id => @post.id
        # should respond_with :redirect
        should redirect_to :controller => :home, :action => :index
        
        assigns(:post).titulo.should == "Titulo"
    end 
     
   it "deveria renderizar a tela de edit quando acontecer erro" do
     put :update, :post => {:titulo => ""}, :id => @post.id
     response.should  render_template(:edit)
     
     assigns(:post).errors.should_not be_nil
   end
   
  it "deveria remover um post" do
    3.times { Post.create(:titulo => "Titulo", :corpo => "Corpo do post") }
    Post.all.size.should eql(4)
    
    post :destroy, :id => @post.id
    # should respond_with :redirect
    should redirect_to :controller => :home, :action => :index
    
    Post.all.size.should eql(3)
  end
end
