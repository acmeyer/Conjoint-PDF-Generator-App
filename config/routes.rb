Rails.application.routes.draw do
  resources :conjoint_experiments

  root to: "conjoint_experiments#index"
end
