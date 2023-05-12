# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# In your seed file (e.g., db/seeds.rb)
require 'faker'

# Create parent users
parent1 = User.create(
  email: 'parent1@example.com',
  password: 'password',
  first_name: 'John',
  last_name: 'Doe',
  role: 'parent'
)

parent2 = User.create(
  email: 'parent2@example.com',
  password: 'password',
  first_name: 'Jane',
  last_name: 'Smith',
  role: 'parent'
)

# Create children
10.times do
  Child.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 5),
    parent_id: [parent1.id, parent2.id].sample
  )
end

# Create attendance records
children = Child.all
children.each do |child|
  5.times do
    check_in_time = Faker::Time.between(from: DateTime.now - 7, to: DateTime.now)
    check_out_time = check_in_time + rand(1..4).hours
    AttendanceRecord.create(
      child_id: child.id,
      check_in_time: check_in_time,
      check_out_time: check_out_time
    )
  end
end

# Create images
children.each do |child|
  3.times do
    Image.create(
      child_id: child.id,
      image_url: Faker::LoremPixel.image(size: "300x200", is_gray: false, category: 'abstract'),
      description: Faker::Lorem.sentence
    )
  end
end

# Create mass emails
admin = User.create(
  email: 'admin@example.com',
  password: 'password',
  first_name: 'Admin',
  last_name: 'User',
  role: 'admin'
)

5.times do
  MassEmail.create(
    admin_id: admin.id,
    subject: Faker::Lorem.sentence,
    context: Faker::Lorem.paragraph,
    sent_at: Faker::Time.between(from: DateTime.now - 7, to: DateTime.now)
  )
end

# Create notes
admin = User.find_by(role: 'admin')
children.each do |child|
  2.times do
    Note.create(
      child_id: child.id,
      admin_id: admin.id,
      context: Faker::Lorem.paragraph,
      submitted: [true, false].sample
    )
  end
end
