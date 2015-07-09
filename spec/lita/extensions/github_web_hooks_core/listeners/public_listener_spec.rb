require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe PublicListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Public hook" do
        expect{
          PublicListener.new(double("Public"))
        }.not_to raise_error
      end
      
      subject{ PublicListener.new(double("Public")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:public)
      end
          
      it "should render message" do
        payload = fixture_file("commit_comment")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Public.new(robot, payload)
        expect{
          expect(PublicListener.new(hook).message).to match(hook.repo)
        }.not_to raise_error
      end
  
    end
  end
end
