module Links
  module Commands
    # Helper method
    # Refactor this after couple of iterations, when future would be clear

    def self.perform_default_pipeline_for(link)
      cmds = Links::Commands::Composite.new(link)
      cmds.add_command(Links::Commands::Prepare)
      cmds.add_command(Links::Commands::Validate)
      cmds.add_command(Links::Commands::Create)
      cmds.execute

      [link.persisted?, link]
    end
  end
end
