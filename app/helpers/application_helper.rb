module ApplicationHelper
  def link_activate(link_path)
    current_path = request.headers['PATH_INFO']

    if link_path == root_path
      if current_path == link_path
        return ' class="active"'
      end

    else
      if current_path.match(link_path)
        return ' class="active"'
      end
    end

    return ''
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
