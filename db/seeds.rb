puts "Cleaning database..."
Cow.destroy_all
# Bookings.destroy_all

images_cows = [
  "https://images.unsplash.com/photo-1564677349626-2de4b8274089?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1734&q=80",
  "https://images.unsplash.com/photo-1531299192269-7e6cfc8553bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  "https://images.unsplash.com/photo-1583308148140-b7079097d5df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
  "https://images.unsplash.com/photo-1562863010-fabae474973d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  "https://images.unsplash.com/photo-1622829691955-5f09114c44d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  "https://images.unsplash.com/photo-1604860422084-ef45ef5e046c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  "https://images.unsplash.com/photo-1597132802283-64f32c5d6479?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80",
  "https://images.unsplash.com/photo-1591068450470-1e3b0077b6e7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  "https://images.unsplash.com/photo-1556997685-309989c1aa82?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1746&q=80",
  "https://images.unsplash.com/photo-1595365691689-6b7b4e1970cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1365&q=80",
  "https://images.unsplash.com/photo-1607771459220-36163d88974c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80",
  "https://images.unsplash.com/photo-1611520555193-151e472b7f6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1365&q=80"
]

num = 0


puts "Creating User..."
user = User.new(
  email: Faker::Internet.email,
  password: "password",
  first_name: "Uma",
  last_name: "Thurman"
);
user.save!

puts "Creating Tags..."
tags = ["cuddly", "sassy", "tall", "chewy", "mouthy", "chonky", "oh-lawd-she-comin", "stinky", "queen"]
tags_obj_arr = []
tags.each do |tag_name|
  tag = Tag.new(name: tag_name)
  tag.save!
  tags_obj_arr << tag
end

puts "Creating Cows..."
images_cows.shuffle.each do |image|
  cow = Cow.new(
    name: Faker::Name.middle_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price_per_day: [10, 30, 50, 80, 100].sample,
    user_id: user.id
  )

  cow.photo.attach(
  filename: "Cow#{num}.jpg",
  io: URI.open(image)
)

  puts "Create a cow(#{num}): #{cow.name}"
  cow.save!
  num += 1

  puts "Create cow(#{num}): #{cow.name} Tag"
  [1, 2, 3].sample.times do
    cow_tag = CowTag.new(
      cow_id: cow.id,
      tag_id: tags_obj_arr.sample.id)
    cow_tag.save!
  end

  if num > 5
    break
  end
end
puts "End of creation of Cows."
