require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe Status, lita: true do
  
    let(:payload){ fixture_file("status") }
    let(:robot){ Lita::Robot.new(registry) }
  
    subject{ Status.new(robot, payload) }
  
    context "data collection" do
      it "should supply status" do
        expect(subject.status).not_to be_nil
      end
      it "should expect sha" do
        expect(subject.sha).not_to be_nil
      end
    end
  
  end
end