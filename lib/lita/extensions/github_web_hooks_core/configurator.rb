module Lita
  module Extensions
    module GitHubWebHooksCore
      class Configurator
        def self.call(payload)
          Lita.logger.info("Beginning GitHub Web Hooks configuration")
          config_path = payload[:config_path]
          Lita.logger.info(config_path)
          Configuration.read("listeners.yml")
          Lita.logger.debug(Configuration.config.inspect)
        end
      end
      Lita.register_hook(:config_finalized, Configurator)
    end
  end
end