
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
  
  def group_posts_by_month_and_day(posts)
    group = [:year, :month, :day]
    posts.reverse.group_by { 
      |post| 
      group.map { |field| post.date.send(field) }
    }.each do |(year, month, day), posts|
      yield(year, month, day, posts)
    end
  end
end