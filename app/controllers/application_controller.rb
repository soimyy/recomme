class ApplicationController < ActionController::Base

    # CSRF対策
    protect_from_forgery

    # フィルタリング
    before_action :set_current_user
    # before_action :authenticate_user, {only: [:edit, :update]}

    ############################
    ## ログイン中のユーザーを設定する
    ############################
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    ############################
    ## ログイン認証
    ############################
    def authenticate_user
        if @current_user == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/login")
        end
    end

    ############################
    ## ログインユーザーを禁止する
    ############################
    def forbid_login_user
        if @current_user
            flash[:notice] = "すでにログインしています"
            redirect_to("/posts/index")
        end
    end
    
end
