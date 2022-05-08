class AddUuidToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :uuid, :string
    add_index :posts, :uuid
  end
end
