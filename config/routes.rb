Rails.application.routes.draw do

  ################
  ## 投稿関連
  ################
  get 'posts/index' => 'posts#index'    # 投稿一覧
  get 'posts/new' => 'posts#new'        # 投稿新規作成
  get 'posts/:id' => 'posts#show'       # 投稿詳細
  get "posts/:id/edit" => "posts#edit"  # 投稿編集

  post 'posts/:id/destroy' => 'posts#destroy'   # 投稿削除
  post 'posts/:id/update' => 'posts#update'     # 投稿更新
  post 'posts/create' => 'posts#create'         # 投稿新規作成


  ################
  ## ユーザー関連
  ################
  get 'users/index' => 'users#index'    # ユーザー一覧

  
  ################
  ## 基本情報関連
  ################
  get '/' => 'home#top'       # トップページ
  get 'about' => 'home#about' # サービス紹介ページ

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
