class CreateCharacterAbilities < ActiveRecord::Migration
  def change
    create_table :character_abilities do |t|
      t.integer :character_id
      t.integer :ability_id

      t.timestamps null: false
    end
  end
end
