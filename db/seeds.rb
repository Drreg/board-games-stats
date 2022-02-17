# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Store.create(
  [
    { name: 'desktopgames', link: 'https://desktopgames.com.ua/' },
    { name: 'geekach', link: 'https://geekach.com.ua/' },
    { name: 'hod-konem', link: 'https://hod-konem.com/' },
    { name: 'bgames', link: 'https://www.bgames.com.ua/' },
    { name: 'hobbygames', link: 'https://hobbygames.biz/' },
    { name: 'planeta-igr', link: 'https://planeta-igr.com/' },
  ]
)
