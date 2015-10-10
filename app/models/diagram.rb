class Diagram < ActiveRecord::Base
  has_many :shapes

  validates :name, presence: true
end
