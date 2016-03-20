class RemoveUniverseFromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :universe
  end
end
