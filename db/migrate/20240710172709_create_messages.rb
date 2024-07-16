class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
