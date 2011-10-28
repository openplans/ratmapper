Stationgrade::Application.routes.draw do
  resources :stops, :path => :stations, :only => [:show, :index] do
    resources :incidents, :only => [:new, :create, :show]
  end
  
  root :to => "stops#index"
end
