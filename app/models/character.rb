class Character < ActiveRecord::Base
  belongs_to :universe
  has_many :character_abilities
  has_many :abilities, through: :character_abilities

  validates :hero_name, presence: true
  validates :hero_name, uniqueness: { case_sensitive: false }
  validates :universe, presence: true
  # validates :universe_name, uniqueness: {case_sensitive: true} I wanted to make universe name unique...
end
