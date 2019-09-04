module ApplicationHelper

  def full_title(page_name = "")
    base_title = "Sample"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
end

require "uri"
 
  def content_url_to_link(content)
 
    URI.extract(content, ["http", "https"]).uniq.each do |url|
      content.gsub!(url, "#{url}")
    end
    content
  end 