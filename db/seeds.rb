# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Theater.find_by(theater_number: 1).nil?
  t = Theater.new
  t.theater_number=1
  t.type_theater= "N"
  t.save
end

if Theater.find_by(theater_number: 2).nil?
  t = Theater.new
  t.theater_number=2
  t.type_theater= "N"
  t.save
end

if Theater.find_by(theater_number: 3).nil?
  t = Theater.new
  t.theater_number=3
  t.type_theater= "N"
  t.save
end

if Theater.find_by(theater_number: 4).nil?
  t = Theater.new
  t.theater_number=4
  t.type_theater= "P"
  t.save
end

if User.find_by(email:"client@client.com").nil?
  u1 = User.new
  u1.name="Johan client"
  u1.email="client@client.com"
  u1.ci= '1'
  u1.password="12345"
  u1.role="C"
  u1.save
end

if User.find_by(email:"employee@employee.com").nil?
  u1 = User.new
  u1.name="Johan empleado"
  u1.email="employee@employee.com"
  u1.ci= '2'
  u1.password="12345"
  u1.role="E"
  u1.save
end

if User.find_by(email:"admin@admin.com").nil?
  u1 = User.new
  u1.name="Johan Admin"
  u1.email="admin@admin.com"
  u1.ci= '3'
  u1.password="12345"
  u1.role="A"
  u1.save
end

if Seat.find_by(id:200).nil?
  Seat.transaction do
    for i in (:A..:J)
      for j in (1..20)
        seat = Seat.new(row: i, col: j)
        seat.save
      end
    end
  end
end

if Setting.take.nil?
  c = Setting.new(price_ticket_type_1: 500)
  c.save
end