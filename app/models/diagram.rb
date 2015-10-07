class Diagram < ActiveRecord::Base
  validates :name, presence: true
end
