Realtor::Application.routes.draw do
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