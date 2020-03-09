module ApplicationHelper

  def full_title(page_name = "")
    base_title = "Sample"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
  require "uri"
  
  def text_url_to_link(details)
    
    URI.extract(details, ["http", "https"]).uniq.each do |url|
      sub_details = ""
      sub_details << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
      
      details.gsub!(url, sub_details)
    end
    return details
  end
end