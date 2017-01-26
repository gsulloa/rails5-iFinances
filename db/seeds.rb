# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create(email: 'admin@ifinances.io', password: '1q2w3e4r5tifinances', role: 1)

general_icategory = Icdefault.create!(name: "General", default: true)
general_ecategory = Ecdefault.create!(name: "General", default: true)

["Sueldo", "Regalo", "Reembolso", "Inversion"].each do |name|
	Icdefault.create!(name: name)
end

["Ropa", "Comida", "Transporte", "Casa", "Vacaciones", "Salud", "Entretenimiento"].each do |name|
	Ecdefault.create!(name: name)
end



