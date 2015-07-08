module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        class DeploymentStatusListener < BaseListener
          
          event_type :deployment_status
      
        end
      end
    end
  end
end