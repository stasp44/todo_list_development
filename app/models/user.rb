class User < ActiveRecord::Base
  attr_accessible :email

  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email, :message => "must be unique"

   has_many :todo_lists
end
