def config_file
  File.join(File.dirname(__FILE__), "../fixtures/config.yml")
end

#Lita::Handlers::GitHubWebHooks::Listeners::Configuration.read(config_file)