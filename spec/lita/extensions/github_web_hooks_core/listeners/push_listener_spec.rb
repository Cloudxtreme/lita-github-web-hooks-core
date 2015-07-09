require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe PushListener, lita: true do
      let(:robot){ Lita::Robot.new(registry) }          
      it "should initialize with a push hook" do
        expect{
          PushListener.new(double("Push"))
        }.not_to raise_error
      end
      
      subject{ PushListener.new(double("Push")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:push)
      end
          
      it "should include data in message" do
        payload = fixture_file("push")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Push.new(robot, payload)
        expect{
          expect(PushListener.new(hook).message).to match(hook.commit_count)
        }.not_to raise_error
      end
  
    end
  end
end
