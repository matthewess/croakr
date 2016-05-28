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

  #generate an active class for the active nav link, otherwise empty class
  def active_navbar_class(page_path)
    current_page?(page_path) ? "active" : ""
  end

  #generate a navbar element for a specific path and label
  def navbar_element(title, page_path, method="")
    content_tag :li, link_to(title, page_path, method: method), class: active_navbar_class(page_path)
  end
end
