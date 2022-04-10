
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
user = {id: 1, name: "Page", description: "app creator!!", thumbnail: "https://avatars.githubusercontent.com/u/53319614?s=400&u=9fd57e4b5146de1510b0660a9d027aa41809a0d4&v=4", resourceURI: 'www.github.com'}
User.create(user)

data = Api.fetch_marvel

data.map do |record|
  User.create({ 
    userId: record["id"],                                                 
    name: record["name"],                                    
    description: record["description"],              
    thumbnail: (record["thumbnail"]["path"] + "." + record["thumbnail"]["extension"]),
    resourceURI: record["resoruceURI"]
  })
end

p "seeded!"
