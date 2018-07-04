class Comment < ApplicationRecord
	belongs_to :blog 
	belongs_to :user
	belongs_to :replied, polymorphic: true
	has_many :comments, as: :replied
end
