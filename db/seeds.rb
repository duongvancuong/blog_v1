Role.create(name: :admin)
Role.create(name: :client)
user1 = User.create(username: 'Admin',
                    email: 'admin@gmail.com',
                    password: '123123123',
                    password_confirmation: '123123123')
user1.add_role(:admin)
user2 = User.create(username: 'Client',
                    email: 'client@gmail.com',
                    password: '123123123',
                    password_confirmation: '123123123')
user2.add_role(:client)
