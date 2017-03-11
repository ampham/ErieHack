class Location < ApplicationRecord
	# This may or may not help in accessing the API
	ActiveRecord::Base.include_root_in_json = true

	validates :title, 			presence: true, length: { minimum: 4 }
	validates :description,	presence: true, length: { minimum: 4, maximum: 110 }

	has_many :updates, dependent: :destroy
	has_many :statuses, dependent: :destroy

	
end
