class BuffaloReport < ApplicationRecord

	def self.contains_zip(zip_code)
		all_zips.include? zip_code
	end

	def self.all_zips
		zips = []
		BuffaloReport.all.each do |report|
			zips << report.zip 
		end
		zips
	end

end
