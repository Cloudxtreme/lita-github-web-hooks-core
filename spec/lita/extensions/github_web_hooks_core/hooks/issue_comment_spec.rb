require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe PullRequest, lita: true do
  
    let(:payload){ fixture_file("issue_comment") }
    let(:robot){ Lita::Robot.new(registry) }
  
    subject{ IssueComment.new(robot, payload) }
  
    context "data collection" do
      it "should supply commenter" do
        expect(subject.commenter).not_to be_nil
      end
          
      it "should supply body" do
        expect(subject.body).not_to be_nil
      end

      it "should supply url" do
        expect(subject.url).not_to be_nil
      end          
          
      it "should supply target" do
        expect(subject.target).not_to be_nil
      end          
          
    end
  
  end
end