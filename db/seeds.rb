# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 10.times do 
# 	Author.create({
# 		name: Faker::Name.name
# 	})
# end

# 10.times do
# 	Genre.create({
# 		name: Faker::Book.genre
# 	})
# end

# 10.times do
# 	Book.create({
# 		title: Faker::Book.title,
# 		summary: Faker::Lorem.sentence,
# 		price: Faker::Commerce.price,
# 		isbn: Faker::Code.isbn,
# 		book_path: Faker::Lorem.sentence,
# 		cover_path: Faker::Lorem.sentence,
# 		author_id: Author.all.sample.id,
# 		genre_id: Genre.all.sample.id
# 	})
# end

# 2.times do
# 	User.create({
# 		first_name: Faker::Name.first_name,
# 		last_name: Faker::Name.last_name,
# 		username: Faker::Internet.user_name,
# 		email: Faker::Internet.free_email,
# 		encrypted_password: Faker::Internet.password(6),
# 		role: "ADMIN"
# 	})
# end
# users = User.all
# 10.times do
# 	user = User.all.sample
# 	book = Book.all.sample
# 	if user.role == "USER"
# 		BookShelf.create({
# 			user_id: user.id,
# 			book_id: book.id
# 		})
# 	end
# end

# i = 1
# 6.times do 
# 	i+=1
# 	user = User.find(1)
# 	user2 = User.find(i)
# 	if user.role == "USER" && user2.role == "USER"
# 		Follow.create({
# 			user_follower: user,
# 			user_following: user2,
# 			status: "ACCEPTED"
# 		})
# 	end
# end