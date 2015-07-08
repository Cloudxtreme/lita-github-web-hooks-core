module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Push < Hook
        
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def committer
          sender["login"]
        end
      
        def commit_count
          payload["commits"].length.to_s
        end
      
        def sender
          payload["sender"]
        end
      
        def attributes
          {
            committer: committer,
            commit_count: commit_count,
            repo: repo,
            sender: sender
          }
        end
        
        private

        def message
          @message ||= I18n.t(
          "lita.handlers.github_web_hooks.push",
          name: name,
          ref: ref,
          repo: repo,
          compare_url: compare_url
          )
        end

      end
    end

    Configuration.register_hook("push", GitHubWebHooksCore::Hooks::Push)
  end
end
