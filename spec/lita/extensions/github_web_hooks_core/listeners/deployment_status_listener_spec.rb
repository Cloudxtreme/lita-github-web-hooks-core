require 'spec_helper'

module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        describe DeploymentStatusListener, lita: true do
          let(:robot){ Lita::Robot.new(registry) }          
          it "should initialize with a deployment status hook" do
            expect{
              DeploymentStatusListener.new(double("DeploymentStatus"))
            }.not_to raise_error
          end
      
          subject{ DeploymentStatusListener.new(double("DeploymentStatus")) }
      
          it "should know its event type" do
            expect(subject.event_type).to eq(:deployment_status)
          end
          
          it "should include data in message" do
            payload = fixture_file("deployment_status")
            hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::DeploymentStatus.new(robot, payload)
            expect{
              expect(DeploymentStatusListener.new(hook).message).to match(hook.ref)
            }.not_to raise_error
          end
  
        end
      end
    end
  end
end