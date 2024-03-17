require_relative '../lib/order'

inputs = []
until (input = gets.chomp).empty?
  inputs << input
end

order = Order.new(inputs)
puts order.receipt
