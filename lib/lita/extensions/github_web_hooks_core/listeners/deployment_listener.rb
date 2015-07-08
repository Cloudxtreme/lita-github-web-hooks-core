module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        class DeploymentListener < BaseListener
          
          event_type :deployment
      
        end
      end
    end
  end
end