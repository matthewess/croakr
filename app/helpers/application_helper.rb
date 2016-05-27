module ApplicationHelper

  #returns full title for a page, or the trimmed base title if necessary
  def title_for(page_title="")
    base_title = "croakr"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

end
