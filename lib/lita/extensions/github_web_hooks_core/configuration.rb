module Lita
  module Extensions
    module GitHubWebHooksCore
      class Configuration
        
        class << self
          def hooks
            @hooks ||= {}
          end

          def register_hook(key, hook)
            hooks[key] = hook
          end
        
          def listeners
            @listeners ||= []
          end

          def add_listener(listener_class)
            (@listeners ||= []) << listener_class
          end
        
        end        
          
        def self.logger
          Lita.logger
        end
                
        def self.read(file)
          logger.info("Reading github_web_hooks configuration.")
          @@yaml = YAML.load(File.read(file))
        end
        
        def self.config
          if !defined?(@@yaml)
            logger.fatal("No configuration found for github_web_hooks.")
            []
          else
            @@yaml["listeners"]
          end
        end
                
        def self.for(listener)
          config.select{ |stanza| Configuration.new(stanza, listener).matches? }
        end
      
        def initialize(stanza, listener)
          @stanza = stanza
          @listener = listener
        end
      
        def matches?
          right_repo? && !excluded? && right_type
        end
      
        def right_repo?
          @listener.repo == @stanza["to"]
        end
          
        def right_type
          @listener.hook.event_type.to_s == @listener.event_type.to_s
        end
      
        def excluded?
          only_excludes? || excludes_include?
        end
      
        def only_excludes?
          return false if @stanza["only"].nil?
          if @listener.event_type.respond_to? :each
            !@listener.event_type.select do |t|
              @stanza["only"].include?(t.to_s)
            end.any?
          else
            !@stanza["only"].include?(@listener.event_type.to_s)
          end
        end
      
        def excludes_include?
          return false if @stanza["except"].nil?
          @stanza["except"].include?(@listener.event_type)
        end
        
      end
    end
  end
end