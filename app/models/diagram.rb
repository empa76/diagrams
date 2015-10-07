class Diagram < ActiveRecord::Base
  has_many :shares
  has_many :users, through: :shares

  validates :name, presence: true
end
