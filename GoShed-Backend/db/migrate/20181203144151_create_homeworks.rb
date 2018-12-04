class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.integer :user_id
      t.text :message
      t.string :date
      t.timestamps
    end
  end
end
