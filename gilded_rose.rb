class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each &:update_quality
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def increment_quality
    @quality += 1 if @quality < 50
  end

  def decrement_quality
    @quality -= 1 if @quality.positive?
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
    self.decrement_sell_in
    self.increment_quality
    self.increment_quality if self.sell_in.negative?
  end
end

class BackstageItem < Item
  def update_quality
    self.decrement_sell_in
    self.increment_quality
    self.increment_quality if self.sell_in < 10
    self.increment_quality if self.sell_in < 5
    self.quality = 0 if self.sell_in.negative?
  end
end

class SulfurasItem < Item
  def update_quality
    self.quality = 80
  end
end

class GenericItem < Item
  def update_quality
    self.decrement_sell_in
    self.decrement_quality
    self.decrement_quality if self.sell_in.negative?
  end
end