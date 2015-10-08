class Circle < Shape
  store :properties, accessors: %i(radius), coder: JSON

  private

  def set_defaults
    super
    self.kind = :circle
    self.radius = 2
  end

end
