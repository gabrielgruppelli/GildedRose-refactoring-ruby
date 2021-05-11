require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    describe "Aged Brie" do
      it "when sell in above 1 and quality bigger then 50" do
        items = [Item.new("Aged Brie", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 50
      end

      it "when sell in above 1 and quality bigger then 50" do
        items = [Item.new("Aged Brie", 0, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 50
      end

      it "when sell is bigger then 0 and quality less then 50" do
        items = [Item.new("Aged Brie", 10, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 31
      end

      it "when sell is equal 0 and quality less then 50" do
        items = [Item.new("Aged Brie", 0, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 32
      end

      it "when sell is less 0 and quality less then 50" do
        items = [Item.new("Aged Brie", -1, 32)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 34
      end
    end
  end

end
