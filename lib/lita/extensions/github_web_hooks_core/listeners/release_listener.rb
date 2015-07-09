module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class ReleaseListener < BaseListener
          
      event_type :release
      
    end
  end
end
