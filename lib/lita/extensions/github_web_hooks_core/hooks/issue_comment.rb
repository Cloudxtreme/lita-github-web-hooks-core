module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class IssueComment < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def body
          comment["body"]
        end
      
        def comment
          payload["comment"]
        end
      
        def commenter
          payload["sender"]["login"]
        end
      
        def url
          comment["html_url"]
        end
      
        def issue
          payload["issue"]
        end
      
        def number
          issue["number"]
        end
      
        def target
          issue["title"]
        end
      
        def attributes
          {
            body: body,
            comment: comment,
            commenter: commenter,
            number: number,
            repo: repo,
            url: url,
            issue: issue,
            target: target
          }
        end
      end
    end
    Configuration.register_hook("issue_comment", GitHubWebHooksCore::Hooks::IssueComment)
  end
end
