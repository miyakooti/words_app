Question.create!(quiz: "日本一高い山", answer: "富士山", user_id: 1)
Question.create!(quiz: "日本3高い山", answer: "しらん", user_id: 1)
Question.create!(quiz: "日本２高い山", answer: "北岳", user_id: 1)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?