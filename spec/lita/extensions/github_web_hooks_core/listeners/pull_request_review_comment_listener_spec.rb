require 'spec_helper'

module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        describe PullRequestReviewCommentListener, lita: true do
          let(:robot){ Lita::Robot.new(registry) }
          it "should initialize with a PullRequest hook" do
            expect{
              PullRequestReviewCommentListener.new(double("PullRequestReviewComment"))
            }.not_to raise_error
          end
      
          subject{ PullRequestReviewCommentListener.new(double("PullRequestReviewComment")) }
      
          it "should know its event type" do
            expect(subject.event_type).to eq(:pull_request_review_comment)
          end
          
          it "should include data in message" do
            payload = fixture_file("pull_request_review_comment")
            hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::PullRequestReviewComment.new(robot, payload)
            expect{
              expect(PullRequestReviewCommentListener.new(hook).message).to match(hook.path)
            }.not_to raise_error
          end
  
        end
      end
    end
  end
end