# encoding: UTF-8
module ApplicationHelper

  def navigation_tag(current_path, name, icon="", nb_icon=1)
  content_tag(:li, link_to((("<i class=\""+icon+"\"></i>")*nb_icon).html_safe+ " "+name, current_path), 
    class: ((current_page?(current_path) || (current_page?('/') && current_path == '/hotel')) ? "active" : ''))
  end
  
  def drapeau_tag(locale)
    content_tag(:li, link_to(image_tag(locale_to_image[locale])+ " " + locale_to_name[locale], url_for(locale: locale)))
  end
  
  def locale_to_image
 		{'fr' => 'drapeaux/france.gif',
    'en' => 'drapeaux/etats_unis.gif',
    'po' => 'drapeaux/bresil.gif',
    'sp' => 'drapeaux/espagnol.gif',
    'de' => 'drapeaux/allemagne.gif',
    'it' => 'drapeaux/italie.gif'}
  end

  # Usefull when we want at some point to display other languages names in the current language
	def locale_to_name
 		{'fr' => 'Français',
    'en' => 'English',
    'po' => 'portugues',
    'sp' => 'Spanish',
    'de' => 'Deutsch',
    'it' => 'Italiano'}
	end

  # File actionpack/lib/action_view/helpers/asset_tag_helper.rb, line 356
  def light_image_tag(source, options = {})
    options.symbolize_keys!
    src = options[:src] = path_to_image(source)
    unless src =~ /^(?:cid|data):/ || src.blank?
      options[:alt] = options.fetch(:alt){ image_alt(src) }
    end
    if size = options.delete(:size)
      options[:width], options[:height] = size.split("x") if size =~ %{^\d+x\d+$}
    end
    if mouseover = options.delete(:mouseover)
      options[:onmouseover] = "this.src='#{path_to_image(mouseover)}'"
      options[:onmouseout]  = "this.src='#{src}'"
    end

    content_tag(:a, tag("img", options), :href => src, :class => "image-link")
    # content_tag :a, :class => "image-link" do
      # content_tag :img, options
    # end
    # tag("a", href: src) do
      # tag("img", options)
    # end
  end

end
