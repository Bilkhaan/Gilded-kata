class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
        item = update_normal_item_quality(item)
      elsif item.quality < 50
        item.quality = item.quality + 1

        if item.name == 'Backstage passes to a TAFKAL80ETC concert' && item.sell_in < 11 && item.quality < 50
          item.quality = item.quality + 1
          item.quality = item.quality + 1 if item.sell_in < 6 && item.quality < 50
        end
      end

      item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras, Hand of Ragnaros'

      if item.sell_in < 0
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            item = update_normal_item_quality(item)
          else
            item.quality = item.quality - item.quality
          end
        else
          item.quality = item.quality + 1 if item.quality < 50
        end
      end
    end
  end

  def update_normal_item_quality(item)
    if item.quality > 0 && item.name != 'Sulfuras, Hand of Ragnaros'
      item.quality = item.quality - 1
      item.quality = item.quality - 1 if item.name == 'Conjured Mana Cake' && item.quality > 0
    end

    item
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
