class CreateGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :group_owner

      t.timestamps
    end
  end
end
