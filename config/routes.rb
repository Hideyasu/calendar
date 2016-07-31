Rails.application.routes.draw do
  root 'calendar#index'
  get 'calendar/index'
  get "calendar/index/:year/:month/:flag" => "calendar#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
