class Link < ApplicationRecord
  SLUG_ALPHABET = "Bt6gMfj8NdpXyAT5e3vCsqzZFxPhaJuWcbEHn9mkGw7S2KY4QRrDVUL"

  def decoded_url
    URI.decode(url)
  end
end
