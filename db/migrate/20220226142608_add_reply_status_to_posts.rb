class AddReplyStatusToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reply_status, :string, null: false, default: "everyone"
    add_index :posts, :reply_status
  end
end
