require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'

puts "Exercise 3"
puts "----------"

# Your code goes here ...
@store1 = Store.find(1)
@store2 = Store.find(2)
@store1.name = "New Name"
@store1.save

@store3 = Store.find(3)
@store3.destroy
puts "Number of stores: #{Store.count}"
