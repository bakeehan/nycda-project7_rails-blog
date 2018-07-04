class Blog < ApplicationRecord
	has_many :comments
	belongs_to :user
	serialize :taggable, Array
end
