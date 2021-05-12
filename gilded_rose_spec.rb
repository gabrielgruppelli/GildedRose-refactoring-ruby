require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    describe "Aged Brie" do
      it "when sell in is above 0 and quality bigger then 50" do
        items = [Item.new("Aged Brie", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 50
      end

      it "when sell in is above 0 and quality bigger then 50" do
        items = [Item.new("Aged Brie", 0, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 50
      end

      it "when sell in is above then 0 and quality less then 50" do
        items = [Item.new("Aged Brie", 10, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 31
      end

      it "when sell in is equal 0 and quality less then 50" do
        items = [Item.new("Aged Brie", 0, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 32
      end

      it "when sell in is less 0 and quality less then 50" do
        items = [Item.new("Aged Brie", -1, 32)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 34
      end
    end

    describe "Backstage passes to a TAFKAL80ETC concert" do
      it "when sell in is above 0 and quality less then 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 40)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
        expect(items[0].quality).to eq 41
      end

      it "when sell in is above 0 and quality less then 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 40)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 42
      end

      it "when sell in is above 0 and quality less then 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 40)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 43
      end

      it "when sell in is equal 0 and quality less then 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 0
      end

      it "when sell in is above 0 and quality bigger then 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 50
      end

      it "when sell in is equal 0 and quality bigger then 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 0
      end
    end

    describe "Sulfuras, Hand of Ragnaros" do
      it "Don't change" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 11, 40)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 11
        expect(items[0].quality).to eq 40
      end
    end

    describe "Generic Item" do
      it "when sell in is above 0 and quality less then 50" do
        items = [Item.new("Generic Item", 11, 40)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
        expect(items[0].quality).to eq 39
      end

      it "when sell in is equal 0 and quality less then 50" do
        items = [Item.new("Generic Item", 0, 40)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 38
      end
    end
  end

end
