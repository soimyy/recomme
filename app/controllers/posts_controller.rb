class PostsController < ApplicationController

  # 投稿一覧
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # 投稿詳細
  def show

    # URLより、投稿のidを取得する
    id = params[:id]

    # idに一致する投稿を探す
    @post = Post.find_by(id: id)
  end

  # 新規作成
  def new
  end

  # 新規投稿
  def create

    # タイトルを取得する
    title = params[:title]

    # 投稿を生成する
    post = Post.new(title: title)

    # 投稿を保存する
    post.save

    # 投稿一覧にリダイレクトする
    redirect_to("/posts/index")
  end

  def edit

    # URLより、投稿のidを取得する
    id = params[:id]

    # idに一致する投稿を探す
    @post = Post.find_by(id: id)
  end

  # 投稿更新
  def update

    # URLより、投稿のidを取得する
    id = params[:id]

    # idに一致する投稿を探す
    post = Post.find_by(id: id)

    # 投稿の内容を更新する
    post.title = params[:title]

    # 投稿を保存する
    post.save

    # 投稿一覧にリダイレクトする
    redirect_to("/posts/index")
  end
end