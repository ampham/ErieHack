class Alert < ApplicationRecord

	def get_status
		StatusOption.find_by_id(status).name
	end
end
