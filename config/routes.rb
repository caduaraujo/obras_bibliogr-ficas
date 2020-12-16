Rails.application.routes.draw do
  namespace :v1 do
    resource :authors, only: :create
  end
end
