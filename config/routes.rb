BaseApp::Application.routes.draw do

  # Routes pour le login, création de compte etc.
  devise_for :users

  # Accueil
  root :to => "home#index"

end
