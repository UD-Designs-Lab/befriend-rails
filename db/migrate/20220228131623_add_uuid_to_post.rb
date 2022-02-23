class AddUuidToPost < ActiveRecord::Migration[6.0]
  def change
    add_column  :posts, :uuid, :string
    add_index   :posts, :uuid
  end
end
