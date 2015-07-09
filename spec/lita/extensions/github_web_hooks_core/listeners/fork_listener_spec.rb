require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe ForkListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Fork hook" do
        expect{
          ForkListener.new(double("Fork"))
        }.not_to raise_error
      end
      
      subject{ ForkListener.new(double("Fork")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:fork)
      end
          
      it "should render message" do
        payload = fixture_file("fork")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Fork.new(robot, payload)
        expect{
          expect(ForkListener.new(hook).message).to match(hook.target)
        }.not_to raise_error
      end
  
    end
  end
end
