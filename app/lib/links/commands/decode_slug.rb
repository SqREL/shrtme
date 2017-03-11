module Links
  module Commands
    module DecodeSlug
      class << self
        def execute(slug)
          slug.each_char.inject(0) do |memo, char|
            memo = memo * Link::SLUG_ALPHABET.length + Link::SLUG_ALPHABET.index(char)
          end
        end
      end
    end
  end
end
