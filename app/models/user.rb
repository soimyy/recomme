class User < ApplicationRecord

    # validation
    # presence: 必ず入力
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :password, {presence: true}
end
