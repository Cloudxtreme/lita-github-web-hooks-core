module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class PullRequest < Hook
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
      
        def attributes
          {requester: requester,
            pr: pr,
            target_branch: target_branch,
            candidate_branch: candidate_branch,
            url: url
          }
        end  
      end
    end
    Configuration.register_hook("pull_request", GitHubWebHooksCore::Hooks::PullRequest)
  end
end
