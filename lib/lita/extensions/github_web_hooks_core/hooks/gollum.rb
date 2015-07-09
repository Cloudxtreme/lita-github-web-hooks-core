module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Gollum < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def author
          payload["sender"]["login"]
        end
        def title
          payload["pages"].first["page_name"]
        end
        def url
          payload["pages"].first["html_url"]
        end
        def attributes
          {
            author: author,
            title: title,
            url: url,
            repository: repository,
            repo: repo
          }
        end
      end
    end

    Configuration.register_hook("gollum", GitHubWebHooksCore::Hooks::Gollum)
  end
end
