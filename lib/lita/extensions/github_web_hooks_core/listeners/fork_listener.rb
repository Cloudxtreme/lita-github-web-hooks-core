module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class ForkListener < BaseListener
          
      event_type :fork
      
    end
  end
end
