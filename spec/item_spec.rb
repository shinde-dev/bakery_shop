describe Item do
  it 'should return packs and total_price if packs for given quantity is available' do
    item = Item.new(10, 'VS5')
    expect(item.packs).to eq([5, 5])
    expect(item.total_price).to eq(17.98)
  end

  it 'should return nil if packs for given quantity is not available' do
    item = Item.new(7, 'VS5')
    expect(item.packs).to eq(nil)
    expect(item.total_price).to eq(nil)
  end
  it 'should raise InvalidItemCode error if code is not valid' do
    expect{Item.new(7, 'invalid')}.to raise_error(InvalidItemCode)
  end
end
