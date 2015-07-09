require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe ReleaseListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Release hook" do
        expect{
          ReleaseListener.new(double("Release"))
        }.not_to raise_error
      end
      
      subject{ ReleaseListener.new(double("Release")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:release)
      end
          
      it "should render message" do
        payload = fixture_file("release")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Release.new(robot, payload)
        expect{
          expect(ReleaseListener.new(hook).message).to match(hook.url)
        }.not_to raise_error
      end
  
    end
  end
end