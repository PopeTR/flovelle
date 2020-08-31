

User.destroy_all
Supplier.destroy_all
Fsubscription.destroy_all
Order.destroy_all

user1 = User.create!(name: 'Boris Becker', email: 'boris@gmail.com', password: 'password', address: 'Amsterdam Noord', zipcode: '1022HG', phone_number: '06 1234 5678', role: 'customer')
user2 = User.create(name: 'Tim Henman', email: 'tim@gmail.com', password: 'password', address: 'Dutch Lane, Amersfoort', zipcode: '3822AW', role: 'customer')
user3 = User.create(name: 'Andy Murray', email: 'andy@gmail.com', password: 'password', address: 'Heineken Lane, Utrecht', zipcode: '1082MD', role: 'customer')
user4 = User.create(name: 'Martina Navratalova', email: 'martina@gmail.com', password: 'password', address: 'Amstel Lane, Amsterdam', zipcode: '1011AB', role: 'customer')
user5 = User.create(name: 'Serena Williams', email: 'serena@gmail.com', password: 'password', address: 'Serena Lane, Amsterdam', zipcode: '1082MM', role: 'customer')

manager1 = User.create(name: 'Steffi Graf', email: 'steffi@gmail.com', password: 'password', address: 'Clog Lane, Amsterdam', zipcode: '1011KT', role: 'manager')

supplier1 = Supplier.create(name: 'Aalsmeer', address: 'Aalsmeer lane, Aalsmeer', zipcode: '1431GZ', email: 'aalsmeer@flowers.com', user_id: manager1.id)
supplier2 = Supplier.create(name: 'Chelsea', address: 'Chelsea lane, London', zipcode: 'N52RT', email: 'chelsea@flowers.com', user_id: manager1.id)
supplier3 = Supplier.create(name: 'Flowery Florist', address: 'Flower lane, Zandvoort', zipcode: '2024JD', email: 'zandvoort@flowers.com', user_id: manager1.id)

subscription1 = Fsubscription.create!(size: 'small', frequency: 1, price: '25', user_id: user1.id)
subscription2 = Fsubscription.create(size: 'small', frequency: 2, price: '25', user_id: user2.id)
subscription3 = Fsubscription.create(size: 'small', frequency: 4, price: '25', user_id: user3.id)
subscription4 = Fsubscription.create(size: 'medium', frequency: 1, price: '40', user_id: user4.id)
subscription5 = Fsubscription.create(size: 'medium', frequency: 2, price: '40', user_id: user5.id)
subscription6 = Fsubscription.create(size: 'medium', frequency: 4, price: '40', user_id: user1.id)
subscription7 = Fsubscription.create(size: 'medium', frequency: 1, price: '40', user_id: user2.id)
subscription8 = Fsubscription.create(size: 'large', frequency: 1, price: '55', user_id: user3.id)
subscription9 = Fsubscription.create(size: 'large', frequency: 2, price: '55', user_id: user4.id)
subscription10 = Fsubscription.create(size: 'large', frequency: 4, price: '55', user_id: user5.id)

order1 = Order.create!(supplier_id: supplier1.id, fsubscription_id: subscription1.id)
order2 = Order.create(supplier_id: supplier2.id, fsubscription_id: subscription2.id)
order3 = Order.create(supplier_id: supplier3.id, fsubscription_id: subscription3.id)
order4 = Order.create(supplier_id: supplier1.id, fsubscription_id: subscription4.id)
order5 = Order.create(supplier_id: supplier2.id, fsubscription_id: subscription5.id)
order6 = Order.create(supplier_id: supplier3.id, fsubscription_id: subscription6.id)
order7 = Order.create(supplier_id: supplier1.id, fsubscription_id: subscription7.id)
order8 = Order.create(supplier_id: supplier2.id, fsubscription_id: subscription8.id)
order9 = Order.create(supplier_id: supplier3.id, fsubscription_id: subscription9.id)
order10 = Order.create(supplier_id: supplier1.id, fsubscription_id: subscription10.id)
