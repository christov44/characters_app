class Ability < ActiveRecord::Base
  has_many :character_abilities
  has_many :characters, through: :character_abilities
end
