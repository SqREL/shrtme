require "rails_helper"

describe Links::Commands::Prepare do
  describe "valid link" do
    context "with schema" do
      let(:http_link)    { double "Link", url: "http://google.com" }
      let(:https_link)   { double "Link", url: "http://google.com" }
      let(:strange_link) { double "Link", url: "http://google.com?query= лол кек чебурек" }

      it "returns the same link when schema is http" do
        expect(http_link)
          .to receive(:url=)
          .with(http_link.url)

        described_class
          .execute(http_link)
      end

      it "returns the same link when schema is https" do
        expect(https_link)
          .to receive(:url=)
          .with(https_link.url)

        described_class
          .execute(https_link)
      end

      it "returns url encoded url" do
        expect(strange_link)
          .to receive(:url=)
          .with("http://google.com?query=%20%D0%BB%D0%BE%D0%BB%20%D0%BA%D0%B5%D0%BA%20%D1%87%D0%B5%D0%B1%D1%83%D1%80%D0%B5%D0%BA")

        described_class
          .execute(strange_link)
      end
    end

    context "without schema" do
      let(:link)    { double "Link", url: "google.com" }

      it "returns the link with http schema" do
        expect(link)
          .to receive(:url=)
          .with("http://#{link.url}/")

        described_class
          .execute(link)
      end
    end
  end

  describe "invalid link" do
    context "blank url" do
      let(:link)    { double "Link", url: "" }

      it "does nothing" do
        expect(link)
          .not_to receive(:url=)

        described_class
          .execute(link)
      end
    end

    context "nil url" do
      let(:link)    { double "Link", url: nil }

      it "does nothing" do
        expect(link)
          .not_to receive(:url=)

        described_class
          .execute(link)
      end
    end
  end
end
