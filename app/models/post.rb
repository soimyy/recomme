class Post < ApplicationRecord

    # バリデーション
    validates :title, {presence: true}              # タイトル空
    validates :title, {length: {maximum: 140}}      # タイトル文字数最大140文字
end
