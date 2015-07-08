require 'spec_helper'

module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        describe CommitCommentListener, lita: true do
          
          let(:robot){ Lita::Robot.new(registry) }
          it "should initialize with a Commit Comment hook" do
            expect{
              CommitCommentListener.new(double("CommitComment"))
            }.not_to raise_error
          end
      
          subject{ CommitCommentListener.new(double("CommitComment")) }
      
          it "should know its event type" do
            expect(subject.event_type).to eq(:commit_comment)
          end
          
          it "should render message" do
            payload = fixture_file("commit_comment")
            hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::CommitComment.new(robot, payload)
            expect{
              expect(CommitCommentListener.new(hook).message).to match(hook.url)
            }.not_to raise_error
          end
  
        end
      end
    end
  end
end