Rails.application.routes.draw do
  # エラー原因: resourcesに対して単数となっていた
  # 修正の意図: Fix type (blog => blogs)
  resources :blogs do
    resources :comments, only: [:create, :destroy]
  end
end
