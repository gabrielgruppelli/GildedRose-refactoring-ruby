require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    context "Generic Item" do
      context "when quality less then 50" do
        it "decreases quality in 1 when sell in is above 0" do
          items = [GenericItem.new("Generic Item", 11, 40)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 10
          expect(items[0].quality).to eq 39
        end

        it "decreases quality in 2 when sell in is below 1" do
          items = [GenericItem.new("Generic Item", 0, 40)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq -1
          expect(items[0].quality).to eq 38
        end
      end
    end

    context "Aged Brie" do
      context "when quality is above 50" do
        it "quality keeps the same if sell in is above 0" do
          items = [AgedBrieItem.new("Aged Brie", 10, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 9
          expect(items[0].quality).to eq 50
        end

        it "quality keeps the same if sell in is below 0" do
          items = [AgedBrieItem.new("Aged Brie", 0, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq -1
          expect(items[0].quality).to eq 50
        end
      end

      context "when quality below 50" do
        it "quality increases in 1 if sell in is above 0" do
          items = [AgedBrieItem.new("Aged Brie", 10, 30)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 9
          expect(items[0].quality).to eq 31
        end

        it "quality increases in 2 if sell in is equal 0" do
          items = [AgedBrieItem.new("Aged Brie", 0, 30)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq -1
          expect(items[0].quality).to eq 32
        end

        it "quality increases in 2 if sell in below 0" do
          items = [AgedBrieItem.new("Aged Brie", -1, 32)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq -2
          expect(items[0].quality).to eq 34
        end
      end
    end

    context "Backstage passes to a TAFKAL80ETC concert" do
      context "when quality is less then 50" do
        it "quality increases 1 if sell in is above 10" do
          items = [BackstageItem.new("Backstage passes to a TAFKAL80ETC concert", 11, 40)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 10
          expect(items[0].quality).to eq 41
        end

        it "quality increases 2 if sell in is below 10 and above 5" do
          items = [BackstageItem.new("Backstage passes to a TAFKAL80ETC concert", 10, 40)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 9
          expect(items[0].quality).to eq 42
        end

        it "quality increases 3 if sell in is below 5 and above 0" do
          items = [BackstageItem.new("Backstage passes to a TAFKAL80ETC concert", 5, 40)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 4
          expect(items[0].quality).to eq 43
        end

        it "quality becomes 0 if sell in is equal 0" do
          items = [BackstageItem.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq -1
          expect(items[0].quality).to eq 0
        end
      end

      context "when quality bigger then 50"  do
        it "quality keeps 50 when sell in is above 0" do
          items = [BackstageItem.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 4
          expect(items[0].quality).to eq 50
        end

        it "quality becomes 0 if sell in is equal 0" do
          items = [BackstageItem.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq -1
          expect(items[0].quality).to eq 0
        end
      end
    end

    context "Sulfuras, Hand of Ragnaros" do
      it "always stays the same" do
        items = [SulfurasItem.new("Sulfuras, Hand of Ragnaros", 0, 80)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 80

        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 80
      end
    end
  end

end
