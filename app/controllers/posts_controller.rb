class PostsController < ApplicationController

    # フィルタリング
    before_action :authenticate_user

  #####################
  # 投稿一覧
  #####################
  def index

    @posts = Post.all.order(created_at: :desc)
    return
  end

  #####################
  # 投稿詳細
  #####################
  def show

    # URLより、投稿のidを取得する
    id = params[:id]

    # idに一致する投稿を探す
    @post = Post.find_by(id: id)

    return
  end

  #####################
  # 新規作成
  #####################
  def new

    # 新規投稿
    @post = Post.new

    return
  end

  #####################
  # 新規投稿
  #####################
  def create

    # タイトルを取得する
    title = params[:title]

    # 投稿を生成する
    @post = Post.new(title: title)

    # 投稿を保存する
    if @post.save.equal?(false)
      # 失敗した場合、新規作成画面にリダイレクトする
      
      # メッセージ表示
      flash[:notice] = "投稿できませんでした"

      # リダイレクト
      render("posts/new")

      return
    end

    # メッセージ表示
    flash[:notice] = "投稿しました"

    # 投稿一覧にリダイレクトする
    redirect_to("/posts/index")

    return
  end

  #####################
  # 投稿編集
  #####################
  def edit

    # URLより、投稿のidを取得する
    id = params[:id]

    # idに一致する投稿を探す
    @post = Post.find_by(id: id)

    return
  end

  #####################
  # 投稿更新
  #####################
  def update

    # URLより、投稿のidを取得する
    id = params[:id]

    # idに一致する投稿を探す
    @post = Post.find_by(id: id)

    # 投稿の内容を更新する
    @post.title = params[:title]

    # 保存に失敗したとき、編集ページへリダイレクトする
    if @post.save.equal?(false)

      # メッセージ表示
      flash[:notice] = "更新できませんでした"

      render("posts/edit")
    end

    # メッセージ表示
    flash[:notice] = "更新しました"

    # 投稿一覧へリダイレクトする
    redirect_to("/posts/index")
    
    return
  end

  #####################
  # 投稿削除
  #####################
  def destroy

    # URLより、投稿のidを取得する
    id = params[:id]

    # idに一致する投稿を探す
    @post = Post.find_by(id: id)
    
    # 投稿を削除する
    if @post.destroy.equal?(false)

      # メッセージを表示する
      flash[:notice] = "削除できませんでした"
    end

    # メッセージを表示する
    flash[:notice] = "削除しました"

    # 投稿一覧にリダイレクトする
    redirect_to("/posts/index")
    return
  end
  
end