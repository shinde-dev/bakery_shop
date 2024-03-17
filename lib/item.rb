require_relative 'pack_finder'

class Item

  include PackFinder
  attr_reader :code, :quantity, :packs

  def initialize(quantity, code)
    @quantity = quantity.to_i
    @code = code
    @packs = set_packs
  end

  def total_price
    return unless packs
    total_price = packs.uniq.inject(0) { |sum, pack_size| sum + packs.count(pack_size) * pack_price(pack_size) }
    total_price.round(2)
  end

  def pack_price(pack_size)
    pack = config[code]['packs'].detect { |p| p['quantity'] == pack_size }
    return unless pack
    pack_price = pack['price'].to_f
  end
end
