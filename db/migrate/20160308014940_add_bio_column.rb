class AddBioColumn < ActiveRecord::Migration
  def change
    add_column :characters, :bio, :text
  end
end
