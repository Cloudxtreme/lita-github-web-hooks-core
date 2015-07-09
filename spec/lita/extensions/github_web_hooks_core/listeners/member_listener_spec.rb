require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe MemberListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Member hook" do
        expect{
          MemberListener.new(double("Member"))
        }.not_to raise_error
      end
      
      subject{ MemberListener.new(double("Member")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:member)
      end
          
      it "should render message" do
        payload = fixture_file("member")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Member.new(robot, payload)
        expect{
          expect(MemberListener.new(hook).message).to match(hook.admin)
        }.not_to raise_error
      end
  
    end
  end
end
