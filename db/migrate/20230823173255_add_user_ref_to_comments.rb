class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :commenter, null: false, foreign_key: { to_table: :users }
  end
end
