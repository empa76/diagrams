class Shape < ActiveRecord::Base
  belongs_to :diagram
  validates :kind, :label, presence: true
  store :properties, accessors: %i(color), coder: JSON
end
