require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe PullRequest do
  
    let(:payload){ fixture_file("pull_request") }
  
    subject{ PullRequest.new(payload) }
  
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
      it "should gather information about the ref" do
        expect(subject.ref).not_to be_nil
      end
      it "should expose the performed action" do
        expect(subject.action).not_to be_nil
      end
       
    end
  
  end
end