module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class PullRequestReviewComment < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def requester
          payload["sender"]
        end
      
        def pr
          payload["pull_request"]
        end
      
        def target_branch
          pr["base"]["label"]
        end
      
        def candidate_branch
          pr["head"]["label"]
        end
      
        def url
          pr["html_url"]
        end
      
        def body
          comment["body"]
        end
      
        def comment
          payload["comment"]
        end
      
        def commenter
          payload["sender"]["login"]
        end
      
        def path
          comment["path"]
        end
      
        def number
          pr["number"]
        end
      
        def ref
          pr["ref"]
        end
      
        def attributes
          {
            requester: requester,
            pr: pr,
            repo: repo,
            ref: ref,
            path: path,
            number: number,
            target_branch: target_branch,
            candidate_branch: candidate_branch,
            url: url,
            body: body,
            comment: comment,
            commenter: commenter
          }
        end
      end
    end
    Configuration.register_hook("pull_request_review_comment", GitHubWebHooksCore::Hooks::PullRequestReviewComment)
  end
end
