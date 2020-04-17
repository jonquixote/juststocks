Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
	resources :strategies do
	  resources :holdings_currents
  	  resources :holdings_returns
  	  resources :holdings_fundamentals
  	  resources :holdings_historicals
	end
	resources :stocks
	resources :drinks
  end

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
	  !request.xhr? && request.format.html?
	end
end