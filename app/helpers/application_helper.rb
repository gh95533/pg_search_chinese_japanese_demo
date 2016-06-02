module ApplicationHelper
  def link_activate(link_path)
    if current_page? link_path
      ' class="active"'
    else
      ''
    end
  end

  def menubar_list_items
    items = [
        {:text => 'Top', :path => root_path},
        {:text => 'Articles', :path => articles_path},
    ]
    html = ''
    items.each do |item|
      text = item[:text]
      path = item[:path]
      html = html + %Q(<li#{link_activate(path)}><a href="#{path}">#{text}</a></li>)
    end

    raw(html)
  end

end
