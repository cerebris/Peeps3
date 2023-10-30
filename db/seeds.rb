# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless ENV["RAILS_ENV"] == 'test'
  20.times do |i|
    user = User.create!({ user_name: "user#{i}",
                          first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          email: Faker::Internet.email })
    Image.create!({ file_name: Faker::File.file_name(ext: 'jpg'), imageable: user })
  end

  2.times do |i |
    user = User.create!({ user_name: "admin#{i}",
                          first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          email: Faker::Internet.email,
                          admin: true })
    Image.create!({ file_name: Faker::File.file_name(ext: 'jpg'), imageable: user })
  end

  users = User.all

  2000.times do |i|
    # 10% of contacts are public
    contact = Contact.create({ first_name: Faker::Name.first_name,
                               last_name: Faker::Name.last_name,
                               email: Faker::Internet.email,
                               user: users.sample,
                               public: i % 10 == 0})

    contact.phone_numbers.create({ name: 'cell',
                                   phone_number: Faker::PhoneNumber.cell_phone
                                 })

    contact.phone_numbers.create({ name: 'home',
                                   phone_number: Faker::PhoneNumber.phone_number
                                 })

    3.times do
      Image.create!(file_name: Faker::File.file_name(ext: 'jpg'),
                    imageable: contact)
    end
  end
end
