class Todo < ActiveRecord::Base
  validates_presence_of :memo
  belongs_to :user
  paginates_per 3
  
  def self.list_all
    Todo.order(:due)
  end

  def self.list_by_user(user_id)
    Todo.where(user_id: user_id).order(:due)
  end
end
