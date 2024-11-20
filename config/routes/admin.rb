namespace :admin do
  resources :mine_boards
  get :menu, to: 'mine_boards#menu'
  post :menu, to: 'mine_boards#menu'
end