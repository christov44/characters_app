Rails.application.routes.draw do

resources :characters #needs to match the controller plurality

root "characters#index"

end
