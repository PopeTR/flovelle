User.destroy_all
Supplier.destroy_all
FlowerSubscription.destroy_all
Order.destroy_all

user1 = User.create!(first_name: 'Boris', last_name: 'Becker', email: 'boris@gmail.com', password: 'password', address: 'Amsterdam Noord', zipcode: '1022HG', phone_number: '06 1234 5678', role: 'customer')
user2 = User.create(first_name: 'Tim', last_name: 'Henman', email: 'tim@gmail.com', password: 'password', address: 'Dutch Lane, Amersfoort', zipcode: '3822AW', phone_number: '06 2829 1229', role: 'customer')
user3 = User.create(first_name: 'Andy', last_name: 'Murray', email: 'andy@gmail.com', password: 'password', address: 'Heineken Lane, Utrecht', zipcode: '1082MD', phone_number: '06 5392 2192', role: 'customer')
user4 = User.create(first_name: 'Martina', last_name: 'Navratalova', email: 'martina@gmail.com', password: 'password', address: 'Amstel Lane, Amsterdam', phone_number: '06 2913 3011', zipcode: '1011AB', role: 'customer')
user5 = User.create(first_name: 'Serena', last_name: 'Williams', email: 'serena@gmail.com', password: 'password', address: 'Serena Lane, Amsterdam', phone_number: '06 9428 2831', zipcode: '1082MM', role: 'customer')

manager1 = User.create(first_name: 'Steffi', last_name: 'Graf', email: 'steffi@gmail.com', password: 'password', address: 'Clog Lane, Amsterdam', zipcode: '1011KT', role: 'manager')

supplier1 = Supplier.create(name: 'Aalsmeer', address: 'Aalsmeer lane, Aalsmeer', zipcode: '1431GZ', email: 'aalsmeer@flowers.com', user_id: manager1.id)
supplier2 = Supplier.create(name: 'Chelsea', address: 'Chelsea lane, London', zipcode: 'N52RT', email: 'chelsea@flowers.com', user_id: manager1.id)
supplier3 = Supplier.create(name: 'Flowery Florist', address: 'Flower lane, Zandvoort', zipcode: '2024JD', email: 'zandvoort@flowers.com', user_id: manager1.id)

subscription1 = FlowerSubscription.create!(size: 'small', frequency: 1, price: '25', user_id: user1.id)
subscription2 = FlowerSubscription.create(size: 'small', frequency: 2, price: '25', user_id: user2.id)
subscription3 = FlowerSubscription.create(size: 'small', frequency: 4, price: '25', user_id: user3.id)
subscription4 = FlowerSubscription.create(size: 'medium', frequency: 1, price: '40', user_id: user4.id)
subscription5 = FlowerSubscription.create(size: 'medium', frequency: 2, price: '40', user_id: user5.id)
subscription6 = FlowerSubscription.create(size: 'medium', frequency: 4, price: '40', user_id: user1.id)
subscription7 = FlowerSubscription.create(size: 'medium', frequency: 1, price: '40', user_id: user2.id)
subscription8 = FlowerSubscription.create(size: 'large', frequency: 1, price: '55', user_id: user3.id)
subscription9 = FlowerSubscription.create(size: 'large', frequency: 2, price: '55', user_id: user4.id)
subscription10 = FlowerSubscription.create(size: 'large', frequency: 4, price: '55', user_id: user5.id)

order1 = Order.create!(supplier_id: supplier1.id, flower_subscription_id: subscription1.id)
order2 = Order.create(supplier_id: supplier2.id, flower_subscription_id: subscription2.id)
order3 = Order.create(supplier_id: supplier3.id, flower_subscription_id: subscription3.id)
order4 = Order.create(supplier_id: supplier1.id, flower_subscription_id: subscription4.id)
order5 = Order.create(supplier_id: supplier2.id, flower_subscription_id: subscription5.id)
order6 = Order.create(supplier_id: supplier3.id, flower_subscription_id: subscription6.id)
order7 = Order.create(supplier_id: supplier1.id, flower_subscription_id: subscription7.id)
order8 = Order.create(supplier_id: supplier2.id, flower_subscription_id: subscription8.id)
order9 = Order.create(supplier_id: supplier3.id, flower_subscription_id: subscription9.id)
order10 = Order.create(supplier_id: supplier1.id, flower_subscription_id: subscription10.id)
