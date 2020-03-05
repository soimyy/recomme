class AddPasswordToUsers < ActiveRecord::Migration[6.0]
  def change

    # パスワードカラムの追加
    add_column :users, :password, :string
  end
end
