require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe TeamAddListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Team Add hook" do
        expect{
          TeamAddListener.new(double("TeamAdd"))
        }.not_to raise_error
      end
      
      subject{ TeamAddListener.new(double("TeamAdd")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:team_add)
      end
          
      it "should render message" do
        payload = fixture_file("team_add")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::TeamAdd.new(robot, payload)
        expect{
          expect(TeamAddListener.new(hook).message).to match(hook.team_name)
        }.not_to raise_error
      end
  
    end
  end
end
