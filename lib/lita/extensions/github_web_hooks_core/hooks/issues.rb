module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Issues < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def creator
          payload["sender"]["login"]
        end
        def action
          payload["action"]
        end
        def number
          payload["issue"]["number"]
        end
        def title
          payload["issue"]["title"]
        end
        def url
          payload["issue"]["html_url"]
        end
        def attributes
          {
            creator: creator,
            action: action,
            number: number,
            title: title,
            url: url,
            repository: repository,
            repo: repo
          }
        end
      end
    end
  end
end
