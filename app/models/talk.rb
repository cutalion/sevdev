class Talk < ActiveRecord::Base
  validates_length_of :title, :minimum => 5
  validates_length_of :body,  :minimum => 5
  belongs_to :user
  has_many   :comments
end
