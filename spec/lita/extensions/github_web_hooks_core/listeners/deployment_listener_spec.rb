require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe DeploymentListener, lita: true do
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Deployment hook" do
        expect{
          DeploymentListener.new(double("Deployment"))
        }.not_to raise_error
      end
      
      subject{ DeploymentListener.new(double("Deployment")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:deployment)
      end
          
      it "should include data in message" do
        payload = fixture_file("deployment")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Deployment.new(robot, payload)
        expect{
          expect(DeploymentListener.new(hook).message).to match(hook.ref)
        }.not_to raise_error
      end
  
    end
  end
end
