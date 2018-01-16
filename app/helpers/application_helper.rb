module ApplicationHelper
	def remove_unwanted_words string
		bad_words = ["less than", "about"]

		bad_words.each do |bad|
			string.gsub!(bad + " ", '')
		end

		return string
	end

	def markdown(text)
		options = [autolink: true, tables: true, hard_wrap: true, filter_html: true,
		           no_intraemphasis: true, fenced_code_blocks: true, gh_blockcode: true]
	    if text.blank?
	    	nil
	    else

	      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, *options)
          return markdown.render(text).html_safe
        end
	end
end
