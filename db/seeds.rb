# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 10.times do
#   User.create!(
#     email: Faker::Internet.email,
#     password: "aa1234",
#     encrypted_password: "aa1234"
#     )
# end

users = User.all

9.times do
  topic = Topic.create!(
    title: Faker::Lorem.sentence(word_count: 10),
    body: Faker::Lorem.sentence(word_count: 100),
    user: users.sample
  )

  # 2〜3件のコメントをランダムで作成
  rand(10..15).times do
    topic.comments.create!(
      body: Faker::Lorem.sentence(word_count: 50),
      user: users.sample
    )
  end
end