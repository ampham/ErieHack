class Report < ApplicationRecord
	belongs_to :account

	def get_status
		StatusOption.find_by_id(status).name
	end

	# show the first 35 characters for the Reports dashboard
	def short_version
		retval = body.length > 35 ? body[0..34] << "..." : body
	end

	def customer_name
		Account.find_by_id(account_id).name
	end
end
