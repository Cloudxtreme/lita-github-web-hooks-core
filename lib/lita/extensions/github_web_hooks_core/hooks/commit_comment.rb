module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class CommitComment < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def commenter
          payload["sender"]
        end
      
        def url
          comment["html_url"]
        end
      
        def body
          comment["body"]
        end
      
        def comment
          payload["comment"]
        end
      
        def attributes
          {
            commenter: commenter,
            url: url,
            body: body,
            comment: comment
          }
        end
        
      end
    end
    Configuration.register_hook("commit_comment", GitHubWebHooksCore::Hooks::CommitComment)
  end
end
