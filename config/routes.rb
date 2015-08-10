Realtor::Application.routes.draw do

  resources :actual_units
  resources :actual_unit_wizard
    
  resources :master_contracts do
    member do
      get 'viewpdf'
    end
  end

  mount Ckeditor::Engine => '/ckeditor'
  resources :unit_templates do
    member do
      get 'new_mergable_unit'
    end
  end

  resources :buildings do
    resources :unit_templates
    resources :actual_units
  end

  resources :property_owners do
    resources :development_areas
  end
  
  resources :development_areas do
    resources :buildings
  end
  
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :corporate_tenants
  
end