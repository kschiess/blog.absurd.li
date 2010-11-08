
require 'cgi'
require 'active_support'

module Helpers
  # Links to a tag.
  def tag_link(tag)
    link_to(h(tag), '/tag.html#' + CGI.escape(tag))
  end
  
  # Links to a page
  #
  def link_to_page(page, opts={})
    opts[:text] ||= h(page.title)
    link_to(opts[:text], page.url)
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
  
  def group_posts_by_month_and_day(posts)
    group = [:year, :month]
    posts.group_by { 
      |post| 
      group.map { |field| post.date.send(field) }
    }.to_a.sort.reverse.tap { |i| p i }.each do |(year, month), posts|
      yield(year, month, posts)
    end
  end
end