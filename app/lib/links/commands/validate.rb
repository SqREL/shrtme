module Links
  module Commands
    module Validate
      class << self
        def execute(link)
          Net::HTTP.get_response(
            URI.parse(link.url)
          )
          link
        rescue
          link.errors.add(:url, "is invalid")
          link
        end
      end
    end
  end
end
