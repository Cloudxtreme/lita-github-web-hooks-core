module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Release < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def publisher
          payload["sender"]["login"]
        end
        def version
          payload["release"]["tag_name"]
        end
        def url
          payload["release"]["html_url"]          
        end
        def attributes
          {
            publisher: publisher,
            version: version,
            url: url,
            repository: repository,
            repo: repo
          }
        end
      end
    end
    Configuration.register_hook("release", GitHubWebHooksCore::Hooks::Release)
  end
end
