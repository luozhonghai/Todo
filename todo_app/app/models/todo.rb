class Todo < ActiveRecord::Base
  validates_presence_of :memo
  belongs_to :user
end
