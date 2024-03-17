require 'yaml'
require_relative 'error'

module PackFinder

  def config
    @config ||= YAML.safe_load(File.open('config/bakery_config.yml'))
  end

  def available_packs_quantity
    raise InvalidItemCode, "#{code} is not a valid item code" unless config[code]
    @packs_quantity ||= config[code] && config[code]['packs'].map { |p| p['quantity'] }
  end

  def set_packs
    @pack_sets ||= {}
    unless @pack_sets.nil?
      available_packs_quantity.each { |quant| @pack_sets[quant] = [quant] }
      smallest_pack_size = available_packs_quantity.min
      (1..(smallest_pack_size - 1)).each { |size| @pack_sets[size] = nil }
      @pack_sets[smallest_pack_size + 1] = [1, 1] if smallest_pack_size == 1

      ((smallest_pack_size + 2)..quantity).each do |elem|
        next if @pack_sets[elem]
        (smallest_pack_size..(elem - 1)).reverse_each do |i|
          next unless @pack_sets[i] && @pack_sets[elem - i]
          new_pack_set = [@pack_sets[i], @pack_sets[elem - i]].flatten
          @pack_sets[elem] = new_pack_set if @pack_sets[elem].nil? || @pack_sets[elem].size > new_pack_set.size
        end
      end
    end
    @pack_sets[quantity]
  end
end
