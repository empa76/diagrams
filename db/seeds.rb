# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

%w(John Ben Dan).each do |user_name|
  u = User.create(name: user_name)
  %w(white-board green-table).each do |board_name|
    u.diagrams << Diagram.create(name: board_name)
  end
end

