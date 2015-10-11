# Sample data
%w(white-board green-table).each do |board_name|
  diagram = Diagram.create(name: board_name)
  diagram.shapes << Circle.create(label: 'red-circle')
  diagram.shapes << Rectangle.create(label: 'yellow-rectangle')
end
