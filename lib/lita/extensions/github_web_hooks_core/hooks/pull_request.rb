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
        
        def title
          pr["title"]
        end
        
        def number
          pr["number"]
        end
              
        def target_branch
          pr["base"]["label"].split(":").last
        end
      
        def candidate_branch
          pr["head"]["label"].split(":").last
        end
      
        def url
          pr["html_url"]
        end
        
        def ref
          pr["head"]["ref"]
        end
        
        def action
          payload["action"]
        end
        
        def opened?
          action == "opened"
        end
        
        def synchronized?
          action == "synchronize"          
        end
        
        def closed?
          action == "closed"
        end
        
        def merged?
          closed? && pr["merged"]
        end
      
        def attributes
          {requester: requester,
            pr: pr,
            target_branch: target_branch,
            candidate_branch: candidate_branch,
            url: url
          }
        end
        
        def to_s
          if merged?
            "[#{self.repo}] #{self.requester["login"]} has merged #{candidate_branch} to #{target_branch} and #{self.action} pull request ##{self.number}: #{self.title}"
          else
            "[#{self.repo}] #{self.requester["login"]} has #{self.action} pull request ##{self.number}: #{self.title}: #{self.url}"
          end
        end
      end
    end
  end
end
