# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#

unless User.where(email: 'admin@example.com').exists?
  User.create!(email: 'admin@example.com', password: '111111', admin: true)
end
unless User.where(email: 'user@example.com').exists?
  User.create!(email: 'user@example.com', password: '111111', admin: true)
end
