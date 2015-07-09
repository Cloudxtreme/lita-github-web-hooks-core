module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class DeploymentStatusListener < BaseListener
          
      event_type :deployment_status
      
    end
  end
end
