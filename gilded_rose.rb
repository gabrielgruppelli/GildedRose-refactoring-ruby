class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie"
        item.decrement_sell_in
        item.increment_quality

        if item.sell_in < 0
          item.increment_quality
        end
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.decrement_sell_in
        item.increment_quality

        if item.sell_in < 10
          item.increment_quality
        end

        if item.sell_in < 5
          item.increment_quality
        end

        if item.sell_in < 0
          item.quality = 0
        end
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        item.quality = 80
      else
        item.decrement_sell_in
        item.decrement_quality

        if item.sell_in < 0
          item.decrement_quality
        end
      end
    end
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
    @quality -= 1 if @quality > 0
  end


  def decrement_sell_in
    @sell_in -= 1
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
