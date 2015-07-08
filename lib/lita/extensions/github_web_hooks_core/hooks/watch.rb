module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Watch < Hook
        private

        def message
          @message ||= I18n.t(
          "lita.handlers.github_web_hooks.watch",
          user: user,
          repo: repo,
          stargazers_count: stargazers_count
          )
        end

        def repo
          payload["repository"]["full_name"]
        end

        def stargazers_count
          payload["repository"]["stargazers_count"]
        end

        def user
          payload["sender"]["login"]
        end
      end
    end
    Configuration.register_hook("watch", GitHubWebHooksCore::Hooks::Watch)
  end
end
