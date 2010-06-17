class Comment < ActiveRecord::Base
  validates_length_of :message, :minimum => 5
  belongs_to :user
  belongs_to :post
end
