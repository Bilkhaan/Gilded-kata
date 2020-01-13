require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase
  def test_conjured_before_zero_sellin
    items = [
      Item.new('Conjured Mana Cake', 1, 10),
      Item.new('Conjured Mana Cake', 2, 3)
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Conjured Mana Cake'
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 8

    assert_equal items[1].name, 'Conjured Mana Cake'
    assert_equal items[1].sell_in, 1
    assert_equal items[1].quality, 1
  end

  def test_conjured_after_zero_sellin
    items = [
      Item.new('Conjured Mana Cake', 0, 10),
      Item.new('Conjured Mana Cake', -2, 4),
      Item.new('Conjured Mana Cake', -3, 2),
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Conjured Mana Cake'
    assert_equal items[0].sell_in, -1
    assert_equal items[0].quality, 6

    assert_equal items[1].name, 'Conjured Mana Cake'
    assert_equal items[1].sell_in, -3
    assert_equal items[1].quality, 0

    assert_equal items[2].name, 'Conjured Mana Cake'
    assert_equal items[2].sell_in, -4
    assert_equal items[2].quality, 0
  end

  def test_normal_item_before_zero_sellin
    items = [
      Item.new('Elixir of the Mongoose', 1, 10),
      Item.new('Elixir of the Mongoose', 2, 3)
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Elixir of the Mongoose'
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 9

    assert_equal items[1].name, 'Elixir of the Mongoose'
    assert_equal items[1].sell_in, 1
    assert_equal items[1].quality, 2
  end

  def test_normal_item_after_zero_sellin
    items = [
      Item.new('Elixir of the Mongoose', 0, 10),
      Item.new('Elixir of the Mongoose', -2, 4),
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Elixir of the Mongoose'
    assert_equal items[0].sell_in, -1
    assert_equal items[0].quality, 8

    assert_equal items[1].name, 'Elixir of the Mongoose'
    assert_equal items[1].sell_in, -3
    assert_equal items[1].quality, 2
  end

  def test_aged_brie_before_zero_sellin
    items = [
      Item.new('Aged Brie', 1, 7),
      Item.new('Aged Brie', 2, 49),
      Item.new('Aged Brie', 2, 50),
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Aged Brie'
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 8

    assert_equal items[1].name, 'Aged Brie'
    assert_equal items[1].sell_in, 1
    assert_equal items[1].quality, 50

    assert_equal items[2].name, 'Aged Brie'
    assert_equal items[2].sell_in, 1
    assert_equal items[2].quality, 50
  end

  def test_aged_brie_after_zero_sellin
    items = [
      Item.new('Aged Brie', 0, 10),
      Item.new('Aged Brie', -2, 50),
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Aged Brie'
    assert_equal items[0].sell_in, -1
    assert_equal items[0].quality, 12

    assert_equal items[1].name, 'Aged Brie'
    assert_equal items[1].sell_in, -3
    assert_equal items[1].quality, 50
  end

  def test_backstage_pass_before_zero_sellin
    items = [
      Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 7),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 48),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 5),
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Backstage passes to a TAFKAL80ETC concert'
    assert_equal items[0].sell_in, 11
    assert_equal items[0].quality, 8

    assert_equal items[1].name, 'Backstage passes to a TAFKAL80ETC concert'
    assert_equal items[1].sell_in, 9
    assert_equal items[1].quality, 50

    assert_equal items[2].name, 'Backstage passes to a TAFKAL80ETC concert'
    assert_equal items[2].sell_in, 4
    assert_equal items[2].quality, 8
  end

  def test_backstage_pass_after_zero_sellin
    items = [
      Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10),
      Item.new('Backstage passes to a TAFKAL80ETC concert', -2, 50),
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Backstage passes to a TAFKAL80ETC concert'
    assert_equal items[0].sell_in, -1
    assert_equal items[0].quality, 0

    assert_equal items[1].name, 'Backstage passes to a TAFKAL80ETC concert'
    assert_equal items[1].sell_in, -3
    assert_equal items[1].quality, 0
  end

  def test_sulfuras_before_zero_sellin
    items = [
      Item.new('Sulfuras, Hand of Ragnaros', 1, 7),
      Item.new('Sulfuras, Hand of Ragnaros', 2, 70),
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Sulfuras, Hand of Ragnaros'
    assert_equal items[0].sell_in, 1
    assert_equal items[0].quality, 7

    assert_equal items[1].name, 'Sulfuras, Hand of Ragnaros'
    assert_equal items[1].sell_in, 2
    assert_equal items[1].quality, 70
  end

  def test_sulfuras_after_zero_sellin
    items = [
      Item.new('Sulfuras, Hand of Ragnaros', 0, 10),
      Item.new('Sulfuras, Hand of Ragnaros', -2, 50),
    ]
    GildedRose.new(items).update_quality()

    assert_equal items[0].name, 'Sulfuras, Hand of Ragnaros'
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 10

    assert_equal items[1].name, 'Sulfuras, Hand of Ragnaros'
    assert_equal items[1].sell_in, -2
    assert_equal items[1].quality, 50
  end
end
