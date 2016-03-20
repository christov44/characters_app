class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :hero_name
      t.string :first_name
      t.string :last_name
      t.string :universe

      t.timestamps null: false
    end
  end
end
