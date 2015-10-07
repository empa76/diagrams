class User < ActiveRecord::Base
  has_many :shares
  has_many :diagrams, through: :shares

  validates :name, presence: true
end
