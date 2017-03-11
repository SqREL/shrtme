module Links
  module Commands
    class Prepare
      class << self
        def execute(link)
          new(link).execute
        end
      end

      def initialize(link)
        @link = link
      end

      def execute
        return link if blank_url?

        uri.scheme ||= "http"
        if uri.host.nil?
          uri.host = uri.path
          uri.path = "/"
        end

        link.url = uri.to_s
        link
      end

      private
      attr_reader :link

      def blank_url?
        !link.url.is_a?(String) || link.url.empty?
      end

      def uri
        @uri ||= URI.parse(url_encoded)
      end

      def url_encoded
        URI.encode(link.url)
      end
    end
  end
end
