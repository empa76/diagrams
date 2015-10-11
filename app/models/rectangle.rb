class Rectangle < Shape
  store :properties, accessors: %i(width heigth), coder: JSON

  private

  def set_defaults
    super
    self.kind = :rectangle
    self.width = 4
    self.heigth = 2
  end
end
