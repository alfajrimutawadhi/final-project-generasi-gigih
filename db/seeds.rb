# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Customer.create(name: "fajri", email: "fajri@gmail.com")
Customer.create(name: "nazla", email: "nazla@gmail.com")
Customer.create(name: "arya", email: "arya@gmail.com")

Item.create(name: "Nasi Goreng", description: "Nasi goreng enak", price: 10000)
Item.create(name: "Nasi Uduk", description: "Nasi uduk enak", price: 9000)
Item.create(name: "Nasi Ayam", description: "Nasi ayam enak", price: 12000)
Item.create(name: "Capcay", description: "Capcay enak", price: 10000)
Item.create(name: "Tempe Goreng", description: "Tempe goreng enak", price: 1000)
Item.create(name: "Tahu Goreng", description: "Tahu goreng enak", price: 1000)
Item.create(name: "Kentang Goreng", description: "Kentang goreng enak", price: 4000)
Item.create(name: "Es Teh", description: "Es teh enak", price: 3000)
Item.create(name: "Es Jeruk", description: "Es jeruk enak", price: 3500)
Item.create(name: "Ice Cream", description: "Ice cream enak", price: 5000)

Category.create(name: "Makanan")
Category.create(name: "Minuman")
Category.create(name: "Camilan")
Category.create(name: "Khas Indonesia")
Category.create(name: "Khas China")
Category.create(name: "Khas Barat")

ItemCategory.create(item_id: 1, category_id: 1)
ItemCategory.create(item_id: 1, category_id: 4)
ItemCategory.create(item_id: 2, category_id: 1)
ItemCategory.create(item_id: 2, category_id: 4)
ItemCategory.create(item_id: 3, category_id: 1)
ItemCategory.create(item_id: 3, category_id: 4)
ItemCategory.create(item_id: 4, category_id: 1)
ItemCategory.create(item_id: 4, category_id: 5)
ItemCategory.create(item_id: 5, category_id: 3)
ItemCategory.create(item_id: 5, category_id: 4)
ItemCategory.create(item_id: 6, category_id: 3)
ItemCategory.create(item_id: 6, category_id: 4)
ItemCategory.create(item_id: 7, category_id: 3)
ItemCategory.create(item_id: 7, category_id: 6)
ItemCategory.create(item_id: 8, category_id: 2)
ItemCategory.create(item_id: 8, category_id: 4)
ItemCategory.create(item_id: 9, category_id: 2)
ItemCategory.create(item_id: 9, category_id: 4)
ItemCategory.create(item_id: 10, category_id: 2)
ItemCategory.create(item_id: 10, category_id: 6)

Order.create(status: "NEW", total: 29000, customer_id: 1, created_at: '2022-01-01')
OrderDetail.create(order_id: 1, item_id: 1, quantity: 2, item_price: 10000)
OrderDetail.create(order_id: 1, item_id: 2, quantity: 1, item_price: 9000)

Order.create(status: "NEW", total: 23000, customer_id: 2, created_at: '2022-02-01')
OrderDetail.create(order_id: 2, item_id: 3, quantity: 1, item_price: 12000)
OrderDetail.create(order_id: 2, item_id: 4, quantity: 1, item_price: 10000)
OrderDetail.create(order_id: 2, item_id: 5, quantity: 1, item_price: 1000)

Order.create(status: "NEW", total: 30000, customer_id: 2, created_at: '2022-03-01')
OrderDetail.create(order_id: 2, item_id: 1, quantity: 1, item_price: 10000)
OrderDetail.create(order_id: 2, item_id: 10, quantity: 4, item_price: 5000)

Order.create(status: "NEW", total: 49500, customer_id: 2)
OrderDetail.create(order_id: 2, item_id: 3, quantity: 2, item_price: 12000)
OrderDetail.create(order_id: 2, item_id: 7, quantity: 1, item_price: 4000)
OrderDetail.create(order_id: 2, item_id: 8, quantity: 6, item_price: 3000)
OrderDetail.create(order_id: 2, item_id: 9, quantity: 1, item_price: 3500)

Order.create(status: "NEW", total: 21000, customer_id: 3)
OrderDetail.create(order_id: 2, item_id: 3, quantity: 1, item_price: 12000)
OrderDetail.create(order_id: 2, item_id: 8, quantity: 3, item_price: 3000)

Order.create(status: "NEW", total: 20000, customer_id: 1)
OrderDetail.create(order_id: 2, item_id: 2, quantity: 2, item_price: 9000)
OrderDetail.create(order_id: 2, item_id: 6, quantity: 2, item_price: 1000)

