module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        class PullRequestListener < BaseListener
          
          event_type :pull_request
      
        end
      end
    end
  end
end