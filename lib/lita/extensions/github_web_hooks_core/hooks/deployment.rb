module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Deployment < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def sha
          deploy["sha"]
        end
      
        def environment
          deploy["environment"]
        end
      
        def start_time
          deploy["created_at"]
        end
      
        def deploy
          payload["deployment"]
        end
      
        def deployer
          payload["sender"]["login"]
        end
      
        def ref
          deploy["ref"]
        end
            
        def attributes
        {
          sha: sha,
          ref: ref,
          repo: repo,
          environment: environment,
          start_time: start_time,
          deploy: deploy,
          deployer: deployer
        }
        end        
      end
    end
  end
end
