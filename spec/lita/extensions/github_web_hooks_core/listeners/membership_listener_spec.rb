require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
        describe MembershipListener, lita: true do
          
          let(:robot){ Lita::Robot.new(registry) }
          it "should initialize with a Membership hook" do
            expect{
              MembershipListener.new(double("Membership"))
            }.not_to raise_error
          end
      
          subject{ MembershipListener.new(double("Membership")) }
      
          it "should know its event type" do
            expect(subject.event_type).to eq(:membership)
          end
          
          it "should render message" do
            payload = fixture_file("membership")
            hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Membership.new(robot, payload)
            expect{
              expect(MembershipListener.new(hook).message).to match(hook.team_name)
            }.not_to raise_error
          end
  
        end
      end
    end
