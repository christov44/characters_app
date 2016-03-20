Rails.application.routes.draw do

resources :characters #needs to match the controller plurality
resources :universes
resources :abilities

root "characters#index"

end
