class Diagram < ActiveRecord::Base
  has_many :shares
  has_many :users, through: :shares
  has_many :shapes

  validates :name, presence: true
end
