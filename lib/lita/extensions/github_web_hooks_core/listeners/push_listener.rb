module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class PushListener < BaseListener
          
      event_type :push
      
    end
  end
end
