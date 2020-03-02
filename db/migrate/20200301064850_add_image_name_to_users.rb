class AddImageNameToUsers < ActiveRecord::Migration[6.0]
  def change

    # プロフィール画像の追加
    add_column :users, :image_name, :string
  end
end
