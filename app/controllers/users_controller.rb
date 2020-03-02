class UsersController < ApplicationController

    ############################
    ## ユーザー一覧
    ############################
    def index

        # 全ユーザー情報の取得
        @users = User.all
        return
    end

    ############################
    ## ユーザー詳細
    ############################
    def show
        
        # 特定のユーザーのオブジェクトを取得する
        @user = User.find_by(id: params[:id])
        
        return
    end

    ############################
    ## ユーザー新規作成
    ############################
    def new

        # 生成する
        @user = User.new

        return
    end

    ############################
    ## ユーザー新規作成
    ############################
    def create

        # 生成する
        @user = User.new(
            name: params[:name],
            email: params[:email],
            image_name: "default.png",
        )

        # 保存する
        if @user.save.equal?(false)

            # メッセージを表示する
            flash[:notice] = "登録に失敗しました"

            render("/users/new")
            return
        end

        # 保存完了の場合
        # メッセージを表示する
        flash[:notice] = "登録しました"

        # ユーザー一覧にリダイレクトする
        redirect_to("/users/index")

        return
    end

    ############################
    ## ユーザー編集
    ############################
    def edit

        # 特定のユーザーのオブジェクトを取得する
        @user = User.find_by(id: params[:id])

        return
    end

    ############################
    ## ユーザー編集
    ############################
    def update

        # 特定のユーザーのオブジェクトを取得する
        @user = User.find_by(id: params[:id])

        # ユーザー情報を更新する
        @user.name = params[:name]
        @user.email = params[:email]

        # 画像の取得に失敗したとき
        # if params[:image]
        if params[:image].equal?(false)
            render("users/edit")
            return
        end

        # 画像の情報を取得
        image_data = params[:image]
        
        # データベースのユーザーの画像名を設定する  
        image_name = "#{@user.id}.jpg"
        
        # データベースのユーザーの画像名を更新する
        @user.image_name = image_name
        
        # 画像を保存する    
        image_directory_path = "public/user_images"
        image_file_path = File.join(image_directory_path, image_name)
        File.binwrite(image_file_path, image_data.read)
        # end
            
        # 更新の保存に失敗した場合
        if @user.save.equal?(false)
            render("users/edit")
            return
        end

        # 成功した場合
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to("/users/#{@user.id}")
        return
    end
end
