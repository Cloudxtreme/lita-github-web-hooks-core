require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe DeleteListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Delete hook" do
        expect{
          DeleteListener.new(double("DeleteComment"))
        }.not_to raise_error
      end
      
      subject{ DeleteListener.new(double("Delete")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:delete)
      end
          
      it "should render message" do
        payload = fixture_file("delete")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Delete.new(robot, payload)
        expect{
          expect(DeleteListener.new(hook).message).to match(hook.deletion_name)
        }.not_to raise_error
      end
  
    end
  end
end
