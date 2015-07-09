module Lita
  module Extensions
    module GitHubWebHooksCore
      class Configurator
        def self.call(payload)
          logger.info("Beginning GitHub Web Hooks configuration")
          config_path = payload[:config_path]
          logger.info(config_path)
          Configuration.read("listeners.yml")
        end
      end
      Lita.register_hook(:config_finalized, Configurator)
    end
  end
end