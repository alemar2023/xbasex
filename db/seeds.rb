# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
root_division = Division.create
child1 = root_division.children.create
child2 = root_division.children.create

Voice.create(division: root_division, name: 'Root Division Name', locale: 'EN')
Voice.create(division: child1, name: 'Child 1 Name', locale: 'EN')
Voice.create(division: child2, name: 'Child 2 Name', locale: 'EN')
