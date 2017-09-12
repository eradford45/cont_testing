class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :hair_color, null: false
      t.string :eye_color, null: false
      t.boolean :alive, null: false, default: true

      t.timestamps
    end
  end
end
