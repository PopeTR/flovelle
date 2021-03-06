User.destroy_all
Supplier.destroy_all
FlowerSubscription.destroy_all
Order.destroy_all

user1 = User.create(first_name: 'Boris', last_name: 'Becker', email: 'boris@gmail.com', password: 'password', address: 'Amsterdam Noord', zipcode: '1022HG', phone_number: '+447950213237', role: 'customer')
user2 = User.create(first_name: 'Tim', last_name: 'Henman', email: 'tim@gmail.com', password: 'password', address: 'Dutch Lane, Amersfoort', zipcode: '3822AW', phone_number: '+447950213237', role: 'customer')
user3 = User.create(first_name: 'Andy', last_name: 'Murray', email: 'andy@gmail.com', password: 'password', address: 'Heineken Lane, Utrecht', zipcode: '1082MD', phone_number: '+447950213237', role: 'manager')
user4 = User.create(first_name: 'Martina', last_name: 'Navratalova', email: 'martina@gmail.com', password: 'password', address: 'Amstel Lane, Amsterdam', phone_number: '+447950213237', zipcode: '1011AB', role: 'customer')
user5 = User.create(first_name: 'Serena', last_name: 'Williams', email: 'serena@gmail.com', password: 'password', address: 'Serena Lane, Amsterdam', phone_number: '+447950213237', zipcode: '1082MM', role: 'customer')

manager1 = User.create(first_name: 'Steffi', last_name: 'Graf', email: 'steffi@gmail.com', password: 'password', address: 'Clog Lane, Amsterdam', zipcode: '1011KT', role: 'manager')

supplier1 = Supplier.create(name: 'Aalsmeer', address: 'Aalsmeer lane, Aalsmeer', zipcode: '1431GZ', email: 'aalsmeer@flowers.com', user_id: manager1.id, photo: "https://images.unsplash.com/photo-1593011951342-8426e949371f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=924&q=80")
supplier2 = Supplier.create(name: 'Honselersdijk', address: 'Jupiter 218, Honselersdijk', zipcode: '2675LV', email: 'honselersdijk@flowers.com', user_id: manager1.id, photo: "https://images.unsplash.com/photo-1526399743290-f73cb4022f48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2800&q=80")
supplier3 = Supplier.create(name: 'De Kwakel', address: 'Magnolia 1, De Kwakel', zipcode: '1424LA', email: 'dekwakel@flowers.com', user_id: manager1.id, photo: "https://images.unsplash.com/photo-1537721664796-76f77222a5d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80")

subscription1 = FlowerSubscription.create(size: 'small', frequency: 1, price_cents: 2500, user_id: user1.id, delivery_day: "Monday", time_of_day: '12pm-15pm', delivery_date: '2020-09-03 12:32:52', state: 'pending', supplier_id: supplier1.id)
subscription2 = FlowerSubscription.create(size: 'small', frequency: 2, price_cents: 2500, user_id: user2.id, delivery_day: "Monday", time_of_day: '8am-12pm', delivery_date: '2020-09-03 12:32:52', state: 'paid', supplier_id: supplier1.id)
subscription3 = FlowerSubscription.create(size: 'small', frequency: 4, price_cents: 2500, user_id: user3.id, delivery_day: "Monday", time_of_day: '12pm-15pm', delivery_date: '2020-09-03 12:32:52', state: 'received', supplier_id: supplier1.id)
subscription4 = FlowerSubscription.create(size: 'medium', frequency: 1, price_cents: 4000, user_id: user4.id, delivery_day: "Tuesday", time_of_day: '8am-12pm', delivery_date: '2020-09-03 12:32:52', state: 'received', supplier_id: supplier1.id)
subscription5 = FlowerSubscription.create(size: 'medium', frequency: 2, price_cents: 4000, user_id: user5.id, delivery_day: "Tuesday", time_of_day: '15pm-18pm', delivery_date: '2020-09-03 12:32:52', state: 'paid', supplier_id: supplier2.id)
subscription6 = FlowerSubscription.create(size: 'medium', frequency: 4, price_cents: 4000, user_id: user1.id, delivery_day: "Tuesday", time_of_day: '12pm-15pm', delivery_date: '2020-09-03 12:32:52', state: 'received', supplier_id: supplier2.id)
subscription7 = FlowerSubscription.create(size: 'medium', frequency: 1, price_cents: 4000, user_id: user2.id, delivery_day: "Wednesday", time_of_day: '8am-12pm', delivery_date: '2020-09-03 12:32:52', state: 'received', supplier_id: supplier1.id)
subscription8 = FlowerSubscription.create(size: 'large', frequency: 1, price_cents: 5500, user_id: user3.id, delivery_day: "Wednesday", time_of_day: '12pm-15pm', delivery_date: '2020-09-03 12:32:52', state: 'received', supplier_id: supplier1.id)
subscription9 = FlowerSubscription.create(size: 'large', frequency: 2, price_cents: 5500, user_id: user4.id, delivery_day: "Wednesday", time_of_day: '15pm-18pm', delivery_date: '2020-09-03 12:32:52', state: 'received', supplier_id: supplier3.id)
subscription10 = FlowerSubscription.create(size: 'large', frequency: 4, price_cents: 5500, user_id: user5.id, delivery_day: "Thursday", time_of_day: '12pm-15pm', delivery_date: '2020-09-03 12:32:52', state: 'received', supplier_id: supplier1.id)

# order1 = Order.create(supplier_id: supplier1.id, flower_subscription_id: subscription1.id)
# order2 = Order.create(supplier_id: supplier2.id, flower_subscription_id: subscription2.id)
# order3 = Order.create(supplier_id: supplier3.id, flower_subscription_id: subscription3.id)
# order4 = Order.create(supplier_id: supplier1.id, flower_subscription_id: subscription4.id)
# order5 = Order.create(supplier_id: supplier2.id, flower_subscription_id: subscription5.id)
# order6 = Order.create(supplier_id: supplier3.id, flower_subscription_id: subscription6.id)
# order7 = Order.create(supplier_id: supplier1.id, flower_subscription_id: subscription7.id)
# order8 = Order.create(supplier_id: supplier2.id, flower_subscription_id: subscription8.id)
# order9 = Order.create(supplier_id: supplier3.id, flower_subscription_id: subscription9.id)
# order10 = Order.create(supplier_id: supplier1.id, flower_subscription_id: subscription10.id)
