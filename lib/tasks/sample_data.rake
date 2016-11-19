namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    users = User.all
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end


    User.create!(name: "Example User",
                 email: "super-example@railstutorial.org",
                 password: "1234567",
                 password_confirmation: "1234567")
    99.times do |n|
      name  = Faker::Name.name
      email = "super-example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

  end
end