# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData

50.times do
  Post.create(
    title: RandomData.random_sentance,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

post = Post.find_or_create_by(
  title: RandomData.random_sentance,
  body: "This is a unique paragraph"
)

Comment.find_or_create_by!(
  post: post,
  body: RandomData.random_paragraph
)


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
