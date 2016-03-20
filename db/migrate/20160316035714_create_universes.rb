class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
