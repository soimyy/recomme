class User < ApplicationRecord

    # validation
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
end
