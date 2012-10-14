class TodoList < ActiveRecord::Base
  attr_accessible :description, :due_date, :title

  validates_presence_of :title

  belongs_to :user
end
