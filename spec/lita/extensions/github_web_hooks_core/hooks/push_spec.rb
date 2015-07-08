require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe Push, lita: true do
  
    let(:payload){ fixture_file("push") }
    let(:robot){ Lita::Robot.new(registry) }
  
    subject{ Push.new(robot, payload) }
  
    context "data collection" do
      it "should gather committer" do
        expect(subject.committer).not_to be_nil
      end
      it "should specify pusher" do
        expect(subject.sender).not_to be_nil
      end
    end
  
  end
end