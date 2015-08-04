module Lita::Extensions
  module GitHubWebHooksCore::Hooks
    class Hook
      
      attr_accessor :payload
      
      def initialize(payload)
        @payload = payload
      end
      
    end
  end
end