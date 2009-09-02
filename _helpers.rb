
require 'cgi'

module Helpers
  # Links to a tag.
  def tag_link(tag)
    link_to(h(tag), '/tag#' + CGI.escape(tag))
  end
end