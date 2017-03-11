module Links
  module Commands
    module EncodeSlug
      class << self
        def execute(id)
          id = Integer(id)
          return Link::SLUG_ALPHABET[0] if id == 0

          slug = ''
          while id > 0
            slug << Link::SLUG_ALPHABET[id.modulo(Link::SLUG_ALPHABET.length)]
            id /= Link::SLUG_ALPHABET.length
          end
          slug.reverse
        end
      end
    end
  end
end
