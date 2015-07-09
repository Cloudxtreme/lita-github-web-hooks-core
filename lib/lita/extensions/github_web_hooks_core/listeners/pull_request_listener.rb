module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class PullRequestListener < BaseListener
          
      event_type :pull_request
      
    end
  end
end
