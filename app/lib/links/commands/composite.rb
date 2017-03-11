module Links
  module Commands
    class Composite
      def initialize(link)
        @commands = []
        @link     = link
      end

      def add_command(cmd)
        @commands << cmd
      end

      def execute
        @commands.each do |cmd|
          cmd.execute(@link)
        end

        @link
      end
    end
  end
end
