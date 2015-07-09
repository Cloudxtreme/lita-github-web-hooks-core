require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe WatchListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Watch hook" do
        expect{
          WatchListener.new(double("Watch"))
        }.not_to raise_error
      end
      
      subject{ WatchListener.new(double("Watch")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:watch)
      end
          
      it "should render message" do
        payload = fixture_file("watch")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Watch.new(robot, payload)
        expect{
          expect(WatchListener.new(hook).message).to match(hook.repo)
        }.not_to raise_error
      end
  
    end
  end
end
