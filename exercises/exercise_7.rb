require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store_id, presence: true
end

class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_apparel

  def must_carry_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "must carry at least one of the men's or women's apparel")
      errors.add(:womens_apparel, "must carry at least one of the men's or women's apparel")
    end
  end
end

print "Enter store name: "
store_name = gets.chomp

store = Store.new(name: store_name)

if store.save
  puts "Store was successfully created!"
else
  puts "Failed to create store."
  store.errors.full_messages.each do |error|
    puts error
  end
end
