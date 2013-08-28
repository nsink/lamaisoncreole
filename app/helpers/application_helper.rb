# encoding: UTF-8
module ApplicationHelper

  def navigation_tag(current_path, name, icon="", nb_icon=1, prefix='')
  content_tag(:li, link_to((prefix + (("<i class=\""+icon+"\"></i>")*nb_icon)+ " "+name).html_safe, current_path), 
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

end
