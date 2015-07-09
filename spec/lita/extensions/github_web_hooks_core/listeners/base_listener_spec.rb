require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe BaseListener, lita: true do
  
      context "listening" do
        it "should ascertain self-relevance from config" do
          c = double("Configuration")
          expect(Lita::Extensions::GitHubWebHooksCore::Configuration).to receive(:for){ c }
          expect(c).to receive(:any?){ false }
          pr = double("PullRequest", repo: "testing/tester", event_type: "pull_request")
          expect(BaseListener.new(pr).listening?).not_to eq(true)
        end
      end
      context "acting" do
      end
      context "speaking" do
        let(:file){ config_file }
        let(:robot){ Lita::Robot.new(registry) }
        let(:deploy){ ::Lita::Extensions::GitHubWebHooksCore::Hooks::Deployment.new(robot, fixture_file("deployment")) }
        before(:each) do              
          Lita::Extensions::GitHubWebHooksCore::Configuration.read(file)
        end
        it "should find a room to speak into" do
          expect(
          DeploymentListener.new(deploy).rooms
          ).to include("Public Repo Room")
        end
        it "should create sources" do
          expect{
            DeploymentListener.new(deploy).sources
          }.not_to raise_error
        end
      end
  
    end
  end
end
