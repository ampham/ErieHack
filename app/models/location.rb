class Location < ApplicationRecord
	validates :title, 			presence: true, length: { minimum: 4 }
	validates :description,	presence: true, length: { minimum: 4, maximum: 110 }

	has_many :updates, dependent: :destroy
end
