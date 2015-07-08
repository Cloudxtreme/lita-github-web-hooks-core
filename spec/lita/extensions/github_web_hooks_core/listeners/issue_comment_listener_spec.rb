require 'spec_helper'

module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        describe IssueCommentListener, lita: true do
          let(:robot){ Lita::Robot.new(registry) }          
          it "should initialize with a IssueComment hook" do
            expect{
              IssueCommentListener.new(double("IssueComment"))
            }.not_to raise_error
          end
      
          subject{ IssueCommentListener.new(double("IssueComment")) }
      
          it "should know its event type" do
            expect(subject.event_type).to eq(:issue_comment)
          end
          
          it "should include data in message" do
            payload = fixture_file("issue_comment")
            hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::IssueComment.new(robot, payload)
            expect{
              expect(IssueCommentListener.new(hook).message).to match(hook.body)
            }.not_to raise_error
          end
  
        end
      end
    end
  end
end