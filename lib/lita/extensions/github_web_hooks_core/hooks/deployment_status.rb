module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class DeploymentStatus < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def status
          payload["deployment_status"]["state"]
        end
      
        def deployment_description
          [deploy["description"], status].join(": ")
        end
      
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
          status: status,
          deployment_description: deployment_description,
          ref: ref,
          repo: repo,
          sha: sha,
          environment: environment,
          start_time: start_time,
          deploy: deploy,
          deployer: deployer
        }
        end
      end
    end
    Configuration.register_hook("deployment_status", GitHubWebHooksCore::Hooks::DeploymentStatus)
  end
end
