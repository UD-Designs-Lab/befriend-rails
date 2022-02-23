class CreateReposts < ActiveRecord::Migration[6.0]
  def change
    create_table :reposts do |t|
      t.text        :body
      t.string      :uuid
      t.references  :repostable,       polymorphic: true, null: false
      t.references  :user,              null: false, foreign_key: true

      t.timestamps
    end
    add_index :reposts, :uuid
  end
end
