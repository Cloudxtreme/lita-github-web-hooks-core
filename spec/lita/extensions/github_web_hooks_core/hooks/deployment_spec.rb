require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe Deployment, lita: true do
  
    let(:payload){ fixture_file("deployment") }
    let(:robot){ Lita::Robot.new(registry) }
  
    subject{ Deployment.new(robot, payload) }
  
    context "data collection" do
      it "should supply SHA" do
        expect(subject.sha).not_to be_nil
      end
    end

  end
end