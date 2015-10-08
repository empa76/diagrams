class Shape < ActiveRecord::Base
  after_initialize :set_defaults
  belongs_to :diagram
  validates :label, presence: true
  validates :kind, inclusion: { in: %w(circle rectangle) }, presence: true
  store :properties, accessors: %i(color center_x center_y), coder: JSON

  private

  def set_defaults
    self.center_x = 0
    self.center_y = 0
  end
end
