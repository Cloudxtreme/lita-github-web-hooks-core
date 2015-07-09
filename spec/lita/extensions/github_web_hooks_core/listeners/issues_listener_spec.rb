require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe IssuesListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Commit Comment hook" do
        expect{
          IssuesListener.new(double("Issues"))
        }.not_to raise_error
      end
      
      subject{ IssuesListener.new(double("Issues")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:issues)
      end
          
      it "should render message" do
        payload = fixture_file("issues")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Issues.new(robot, payload)
        expect{
          expect(IssuesListener.new(hook).message).to match(hook.url)
        }.not_to raise_error
      end
  
    end
  end
end
