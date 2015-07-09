module Lita::Extensions
  module GitHubWebHooksCore::Hooks
    class Hook
      attr_reader :payload, :robot

      def initialize(robot, payload)
        @robot = robot
        @payload = payload
        self.class.notify(self)
      end
      

      
      def self.logger
        Lita.logger
      end
              
      def self.notify(instance)
        logger.info { "Notifying listeners of #{instance.event_type} event for #{instance.repo}." }
        Lita::Extensions::GitHubWebHooksCore::Configuration.listeners.map{ |l|
          listener = l.new(instance)
          # Hook defines #call, we're calling a
          # BaseListener descendant
          # version here.
          listener.call if listener.listening?
        }
      end
      
      def self.add_listener(listener_class)
        logger.info("Registering listener #{listener_class}")
        @@listeners ||= []
        @@listeners << listener_class
      end
      
      def self.clear_listeners
        @@listeners = []
      end
      
      def self.listeners_registered?
        @@listeners.any?
      end
      
      def event_type
        # FIXME: This should ideally be reciprocal when registering the hook.
        # Better than copying from activesupport
            self.class.name.split('::').last.gsub(/::/, '/').
              gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
              gsub(/([a-z\d])([A-Z])/,'\1_\2').
              tr("-", "_").
              downcase   
      end
      
      def attributes
        {payload: payload}
      end
      
    end
  end
end