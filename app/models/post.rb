class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categorias
  has_many :comentarios
  
  default_scope :order => "created_at DESC"
  
  validates_presence_of :titulo, :corpo
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
