class Alert < ApplicationRecord

	def get_status
		StatusOption.find_by_id(status).name
	end

	def short_version
		retval = message.length > 35 ? message[0..34] << "..." : message
	end
end
