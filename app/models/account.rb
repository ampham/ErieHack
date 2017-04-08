class Account < ApplicationRecord
	has_many :months_waters, dependent: :destroy
	has_many :reports, dependent: :destroy
end
