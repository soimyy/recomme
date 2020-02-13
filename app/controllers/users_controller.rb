class UsersController < ApplicationController

    ############################
    ## ユーザー一覧
    ############################
    def index

        # 全ユーザー情報の取得
        @users = User.all

        return
    end
end
