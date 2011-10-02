class User < ActiveRecord::Base
  has_many :posts, :order => 'created_at DESC, titulo ASC', :dependent => :destroy
  has_many :comentarios, :order => 'created_at DESC', :dependent => :destroy
  has_one :profile, :dependent => :destroy
  has_many :respostas, :through => :posts, :source => :comentarios
  
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
