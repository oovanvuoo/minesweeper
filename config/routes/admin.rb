namespace :admin do
  resources :mine_boards do
  collection do
    get :menu, to: 'mine_boards#menu'
    post :menu, to: 'mine_boards#menu'

  end
end

end