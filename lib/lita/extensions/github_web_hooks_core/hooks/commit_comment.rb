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
        
        def commit_id
          comment["commit_id"]
        end
      
        def attributes
          {
            commenter: commenter,
            commit_id: commit_id,
            url: url,
            body: body,
            comment: comment,
            repository: repository,
            repo: repo
          }
        end
        
      end
    end
    Configuration.register_hook("commit_comment", GitHubWebHooksCore::Hooks::CommitComment)
  end
end
