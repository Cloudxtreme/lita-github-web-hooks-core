require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe StatusListener, lita: true do
      let(:robot){ Lita::Robot.new(registry) }          
      it "should initialize with a PullRequest hook" do
        expect{
          StatusListener.new(double("Status"))
        }.not_to raise_error
      end
      
      subject{ StatusListener.new(double("Status")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:status)
      end
          
      it "should include data in message" do
        payload = fixture_file("status")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Status.new(robot, payload)
        expect{
          expect(StatusListener.new(hook).message).to match(hook.context)
        }.not_to raise_error
      end
  
    end
  end
end
