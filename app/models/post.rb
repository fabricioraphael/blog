class Post < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :titulo, :corpo
end
