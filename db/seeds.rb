5. times do
    Article.create({
        title: Faker::Book.title,
        description: Faker::Lorem.sentence
    })
end