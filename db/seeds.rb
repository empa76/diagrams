# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

%w(John Ben Dan).each do |user_name|
  user = User.create(name: user_name)
  %w(white-board green-table).each do |board_name|
    diagram = Diagram.create(name: board_name)
    diagram.shapes << Circle.create(label: 'red-circle')
    diagram.shapes << Rectangle.create(label: 'yellow-rectangle')
    user.diagrams << diagram
  end
end

