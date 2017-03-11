require "rails_helper"

describe "Slug integrational test" do
  let(:encoder) { Links::Commands::EncodeSlug }
  let(:decoder) { Links::Commands::DecodeSlug }

  context do
    it do
      expect(encoder.execute(0))
        .to eq("B")
    end

    it do
      expect(decoder.execute("B"))
        .to eq(0)
    end
  end

  context do
    it do
      expect(encoder.execute(2274))
        .to eq("wC")
    end

    it do
      expect(decoder.execute("wC"))
        .to eq(2274)
    end
  end

  100.times do
    it "should never contain i,l,0,1 symbols" do
      expect(
        encoder.execute(rand(999999999))
      ).not_to include("0", "1", "i", "I", "l")
    end
  end
end
