Rails.application.routes.draw do
  resources :conjoint_experiments do
    member do
      get 'trial_data'
    end
  end

  root to: "conjoint_experiments#index"
end
