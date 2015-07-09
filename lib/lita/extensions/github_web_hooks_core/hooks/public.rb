module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Public < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def attributes
          {
            repo: repo
          }
        end        
      end
    end
    Configuration.register_hook("public", GitHubWebHooksCore::Hooks::Public)
  end
end
