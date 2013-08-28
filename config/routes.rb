Rvionwebsite::Application.routes.draw do  

  root to: "welcome#hotel"

  match '/restaurant' => 'welcome#restaurant', as: :restaurant
  match '/hotel'      => 'welcome#hotel',      as: :hotel
  match '/reserver'   => 'welcome#reserver',   as: :reserver
  match '/seminaires' => 'welcome#seminaires', as: :seminaires
  match '/activites'  => 'welcome#activites',  as: :activites

  # match '/accueil' => 'welcome#accueil', as: :accueil
  resources :contact_messages
end
