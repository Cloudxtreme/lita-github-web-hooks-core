module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class DeploymentListener < BaseListener
          
      event_type :deployment
      
    end
  end
end
