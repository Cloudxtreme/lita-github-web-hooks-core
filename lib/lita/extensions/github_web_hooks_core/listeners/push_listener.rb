module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        class PushListener < BaseListener
          
          event_type :push
      
        end
      end
    end
  end
end