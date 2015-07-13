module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class BaseListener
          
      class << self
        attr_accessor :event_type
        def event_type(arg=nil)
          @event_type = arg if arg
          @event_type
        end
      end
  
      attr_accessor :hook
          
      extend Forwardable

      def_delegators :hook, :repo, :repository
  
      def initialize(hook)
        @hook = hook
      end
          
      def logger
        Lita.logger
      end
    
      def listening?
        logger.debug { "Determining if #{self.class.name} is listening to an event on #{self.hook.repo}" }
        if configurations.any?
          logger.degug("#{self.class.name} is listening to an event on #{self.hook.repo}.")
          true
        end
      end
  
      def configurations
        @configurations ||= Lita::Extensions::GitHubWebHooksCore::Configuration.for(self)
      end

      def rooms
        rooms = configurations.collect{ |c|
          c["notify"]
        }.flatten.sort.uniq
        logger.debug(" #{rooms.size} room(s) will receive a message")
        rooms
      end
          
      def sources
        rooms.collect{ |r| Lita::Source.new(room: r) }
      end
                
      def call
        act
        speak
      end
          
      def act
        logger.debug("#{self.class.name} may act.")
      end
          
      def speak
        logger.debug("#{self.class.name} may speak.")
        # It feels like the listener should have more of Lita's guts in it.
        # The hook's robot?  The render template below?
        sources.map{ |s| hook.robot.send_message(s, message) }
      end
          
      def message
        render_template(event_type, hook.attributes)
      end
          
      def event_type
        self.class.event_type
      end
                          
      def self.template_root
        "templates"
      end
                          
      # FIXME: This is a dupe of a method on Handler::Common, not great.
      def render_template(template_name, variables={})
        Lita::Template.from_file(file_for_template(template_name)).render(variables)
      end
          
      def file_for_template(template_name)
        Lita::TemplateResolver.new(
        self.class.template_root,
        template_name,
        @hook.robot.config.robot.adapter
        ).resolve
      end
  
    end
  end
end
