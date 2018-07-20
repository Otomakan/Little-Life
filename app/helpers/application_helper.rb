module ApplicationHelper

	def full_title(page_title = '')
		base_title = "Little Life"
		if page_title.empty?
			base_title
		else
			page_title  + "| Little Life"
		end
	end
end
