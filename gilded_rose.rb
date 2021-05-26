class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:update_quality)
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def increment_quality(multiplier = 1)
    @quality += 1 * multiplier if @quality < 50
  end

  def decrement_quality(multiplier = 1)
    @quality -= 1 * multiplier if @quality.positive?
  end

  def decrement_sell_in
    @sell_in -= 1
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class AgedBrieItem < Item
  def update_quality
    decrement_sell_in
    increment_quality
    increment_quality if sell_in.negative?
  end
end

class ConjuredItem < Item
  def update_quality
    decrement_sell_in
    decrement_quality(2)
  end
end

class BackstageItem < Item
  def update_quality
    decrement_sell_in
    increment_quality
    increment_quality if sell_in < 10
    increment_quality if sell_in < 5
    self.quality = 0 if sell_in.negative?
  end
end

class SulfurasItem < Item
  def update_quality
    self.quality = 80
  end
end

class GenericItem < Item
  def update_quality
    decrement_sell_in
    decrement_quality
    decrement_quality if sell_in.negative?
  end
end
