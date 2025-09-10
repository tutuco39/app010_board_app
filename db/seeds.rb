# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# # 自分
# user = User.create!(
#   email: "master@email.com",
#   password: "aa1234"
# )

# # avatarなしのユーザー
# 2.times do |i|
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: "aa1234"
#   )
# end

# 10.times do |i|
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: "aa1234"
#   )

#   # 画像を添付（例: samples/avatars/avatar1.png）
#   avatar_path = Rails.root.join("db/samples/avatars/avatar#{i % 10 + 1}.png")
#   user.avatar.attach(
#     io: File.open(avatar_path),
#     filename: "avatar#{i + 1}.png",
#     content_type: "image/png"
#   )
# end

users = User.order(:id).to_a
user_cycle = users.cycle   # ←順番に取り出せる

5.times do
  topic = Topic.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    body:  Faker::Lorem.sentence(word_count: 100),
    user: users.sample
    # user:  user_cycle.next          # ←トピック作成者は順番に
  )

  # コメントも順番に（件数はランダム）
  rand(10..15).times do
    topic.comments.create!(
      body: Faker::Lorem.sentence(word_count: 50),
      user: users.sample
      # user: user_cycle.next          # ←コメント投稿者も順番に
    )
  end
end
