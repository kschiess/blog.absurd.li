
require 'cgi'
require 'active_support'

module Helpers
  # Links to a tag.
  def tag_link(tag)
    link_to(h(tag), '/tag#' + CGI.escape(tag))
  end
  
  def countify(number)
    case number
      when 1: '1st'
      when 2: '2nd'
      when 3: '3rd'
    else
      "#{number}th"
    end
  end
end