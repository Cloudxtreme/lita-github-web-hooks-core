module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        class StatusListener < BaseListener
          
          event_type :status
      
        end
      end
    end
  end
end