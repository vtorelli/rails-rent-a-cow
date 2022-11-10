puts "Cleaning database..."
Booking.destroy_all
Cow.destroy_all
User.destroy_all

puts " "
puts "Database deleted successfully."
puts " "
puts "Creating Users..."

array_users = [
  {
    first_name: "Chonky",
    last_name: "McChonk",
    email: "chonky@lewagon.com",
    password: "lewagon"
  },
  {
    first_name: "Astrid",
    last_name: "Cow",
    email: "astrid@lewagon.com",
    password: "lewagon"
  },
  {
    first_name: "Nicolas",
    last_name: "Blanchard",
    email: "nicolas@lewagon.com",
    password: "lewagon"
  },
  {
    first_name: "Rishabh",
    last_name: "Agnihotri",
    email: "rish@lewagon.com",
    password: "lewagon"
  }
]

array_users.each do |user|
  user_new = User.create!(user)

  puts "User (#{user_new.email}) created"
end
puts " "
puts "Users created succesfully."

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
  "https://images.unsplash.com/photo-1611520555193-151e472b7f6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1365&q=80",
  "https://images.unsplash.com/photo-1594661387748-1155d9a8c7a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
  "https://images.unsplash.com/photo-1584977036035-ed7f68721bde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
  "https://images.unsplash.com/photo-1594731884638-8197c3102d1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1175&q=80",
  "https://images.unsplash.com/photo-1634992798921-b968401c7b75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
  "https://images.unsplash.com/photo-1563898159-f139a1719f52?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
  "https://images.unsplash.com/photo-1545185615-ba60d5cd6862?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1604250757408-8602c89b4f80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1264&q=80",
]

num = 0

Tag.destroy_all
puts "Creating Tags..."
tags = ["cuddly", "sassy", "tall", "chewy", "mouthy", "chonky", "oh-lawd-she-comin", "stinky", "queen"]
tags_obj_arr = []
tags.each do |tag_name|
  tag = Tag.new(name: tag_name)
  tag.save!
  tags_obj_arr << tag
end

puts " "
puts "Creating the cows..."

def faker_name()
  loop do
    cow_name = Faker::Name.middle_name
    return cow_name if !cow_name.in? Cow.all.pluck(:name)
  end
end

puts " "
puts "Creating Cows..."
images_cows.shuffle.each do |image|
  cow = Cow.new(
    name: faker_name,
    address: ["Gildehauserweg 37, Losser", "Winkelcentrum Woensel 34, Eindhoven", "Otelaarseweg 5, Barneveld", "Stadhuisplein 10, Zoetermeer", "Brugstraat 30, Gennep"].sample,
    description: Faker::ChuckNorris.fact,
    price_per_day: [10, 30, 50, 80, 100].sample,
    user: User.all.sample
  )

  cow.photo.attach(
  filename: "Cow#{num}.jpg",
  io: URI.open(image)
)

  puts "Created cow n.#{num}): #{cow.name}"
  cow.save!
  num += 1


  tags_copy = tags_obj_arr.clone
  [1, 2, 3].sample.times do
    tag = tags_copy.sample
    tags_copy.delete(tag)
    puts "Creating tag: #{tag.name} for #{cow.name}"
    cow.tags << tag
    # cow_tag = CowTag.new(
    #   cow_id: cow.id,
    #   tag_id: tag.id)
    # cow_tag.save!
  end

  if num > 5
    break
  end
end

puts " "
puts "Cows created successfully."
puts " "
puts "Creating Bookings..."

Booking.create!(
  start_date: "2022-02-02",
  duration: 2,
  location: "Brussels",
  user: User.find_by(first_name: "Astrid"),
  cow: Cow.all[0]
)
puts " "
puts "Bookings created successfully."
