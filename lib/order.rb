require_relative 'item'

class Order
  attr_reader :items

  def initialize(item_details)
    @items = []
    item_details.each do |item_detail|
      @items << Item.new(*item_detail.split)
    end
  end

  def receipt
    output = ''

    items.each do |item|
      if item.packs.nil?
        output += "No item\n"
        next
      end

      output += "#{item.quantity} #{item.code} $#{item.total_price}\n"
      item.packs.uniq.each do |pack_size|
        output += "#{' ' * 6}#{item.packs.count(pack_size)} x #{pack_size} $#{item.pack_price(pack_size)}\n"
      end
    end
    output
  end
end
