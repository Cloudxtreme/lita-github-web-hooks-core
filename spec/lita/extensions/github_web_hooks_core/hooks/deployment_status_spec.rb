require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe DeploymentStatus do
  
    let(:payload){ fixture_file("deployment_status") }
  
    subject{ DeploymentStatus.new(payload) }
  
    context "data collection" do
      it "should supply status" do
        expect(subject.status).not_to be_nil
      end
          
      it "should describe the deployment" do
        expect(subject.deployment_description).not_to be_nil
      end
    end
  
  end
end