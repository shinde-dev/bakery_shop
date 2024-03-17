describe Order do
  it 'should generate receipt for order' do
    items = ['10 VS5', '14 MB11', '13 CF']
    order = Order.new(items)
    ['10 VS5 $17.98', '2 x 5 $8.99', '14 MB11 $54.8', '1 x 8 $24.95',
     '3 x 2 $9.95', '13 CF $25.85', '2 x 5 $9.95', '1 x 3 $5.95'].each do |item|
      expect(order.receipt).to include(item)
    end
  end
end
