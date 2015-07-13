require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe Hook, lita: true do
        
    after(:each) do
      Lita::Extensions::GitHubWebHooksCore::Configuration.clear_listeners
    end
        
    let(:robot){ Lita::Robot.new(registry) }
          
    it "should instantiate a new listener instance when notified" do
      listener_class = class_spy("PullRequestListener")
      Lita::Extensions::GitHubWebHooksCore::Configuration.add_listener(listener_class)
      pr = Hook.new(robot, double("payload"))
      expect(listener_class).to have_received(:new).with(pr)
    end
        
    it "should invoke call on the instantiation if listening" do
      listener_class = class_spy("PullRequestListener")
      Lita::Extensions::GitHubWebHooksCore::Configuration.add_listener(listener_class)
      listener = double("PullRequest", listening?: true)
      expect(listener).to receive(:call)
      expect(listener_class).to receive(:new){ listener }
      pr = Hook.new(robot, double("payload"))
    end
        
    it "should not call on the instantiation if not listening" do
      listener_class = class_spy("PullRequestListener")
      Lita::Extensions::GitHubWebHooksCore::Configuration.add_listener(listener_class)
      listener = double("PullRequest", listening?: false)
      expect(listener).not_to receive(:call)
      expect(listener_class).to receive(:new){ listener }
      pr = Hook.new(robot, double("payload"))
    end
    
  end
end