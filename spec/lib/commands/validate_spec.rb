require "rails_helper"

describe Links::Commands::Validate do
  describe "valid link" do
    let(:link) { double "Link", url: "http://google.com" }
    it "should return link" do
      expect(described_class
        .execute(link)
      ).to eq(link)
    end
  end

  describe "invalid link" do
    context "COMPLETELY invalid" do
      let(:errors) { double "errors" }
      let(:link)   { double "Link", url: "лол кек чебурек", errors: errors }

      it "should return link" do
        expect(errors)
          .to receive(:add)
          .with(:url, "is invalid")

        described_class
          .execute(link)
      end
    end

    context "little invalid" do
      let(:errors) { double "errors" }
      let(:link)   { double "Link", url: "http://google.comssss", errors: errors }

      it "should return link" do
        expect(errors)
          .to receive(:add)
          .with(:url, "is invalid")

        described_class
          .execute(link)
      end
    end

    context "not present" do
      let(:errors) { double "errors" }
      let(:link)   { double "Link", url: "", errors: errors }

      it "should return link" do
        expect(errors)
          .to receive(:add)
          .with(:url, "is invalid")

        described_class
          .execute(link)
      end
    end
  end
end
