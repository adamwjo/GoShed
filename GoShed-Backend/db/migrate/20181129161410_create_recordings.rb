class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.string :name
      t.string :file
      t.integer :user_id
      t.timestamps
    end
  end
end
