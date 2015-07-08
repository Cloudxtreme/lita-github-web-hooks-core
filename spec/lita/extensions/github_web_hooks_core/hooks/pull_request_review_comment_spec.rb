require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe PullRequestReviewComment, lita: true do
  
    let(:payload){ fixture_file("pull_request_review_comment") }
    let(:robot){ Lita::Robot.new(registry) }
  
    subject{ PullRequestReviewComment.new(robot, payload) }
  
    context "data collection" do
      it "should gather information on originator" do
        expect(subject.requester).not_to be_nil
      end
      it "should gather information about the target branch" do
        expect(subject.target_branch).not_to be_nil
      end
      it "should gather information about the candidate branch" do
        expect(subject.candidate_branch).not_to be_nil
      end
      it "should gather information about the repo" do
        expect(subject.repo).not_to be_nil
      end
      it "should expose the URL" do
        expect(subject.url).not_to be_nil
      end
      it "should include the body" do
        expect(subject.body).not_to be_nil
      end
    end
  
  end
end