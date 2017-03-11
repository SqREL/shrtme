module Links
  module Commands
    module Create
      class << self
        def execute(link)
          link.save if link.errors.none?
          link
        end
      end
    end
  end
end
