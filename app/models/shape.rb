class Shape < ActiveRecord::Base
  validates :kind, :label, presence: true
  store :properties, accessors: %i(color), coder: JSON
end
