require "open-uri"

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
cow = Cow.new(name: "NES", description: "A great console", price_per_day: 200, image_url: "http://myimage.com")
cow.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
cow.save
