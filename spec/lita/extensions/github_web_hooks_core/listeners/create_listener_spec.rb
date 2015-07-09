require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe CreateListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Create hook" do
        expect{
          CreateListener.new(double("Create"))
        }.not_to raise_error
      end
      
      subject{ CreateListener.new(double("Create")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:create)
      end
          
      it "should render message" do
        payload = fixture_file("create")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Create.new(robot, payload)
        expect{
          expect(CreateListener.new(hook).message).to match(hook.creator)
        }.not_to raise_error
      end
  
    end
  end
end
