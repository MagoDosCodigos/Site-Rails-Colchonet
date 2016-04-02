class AddConfirmtionFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_at, :datetime
    add_column :users, :confirmation_toke, :string
  end
end
