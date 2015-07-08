require 'spec_helper'

module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        describe PullRequestListener, lita: true do
          let(:robot){ Lita::Robot.new(registry) }          
          it "should initialize with a PullRequest hook" do
            expect{
              PullRequestListener.new(double("PullRequest"))
            }.not_to raise_error
          end
      
          subject{ PullRequestListener.new(double("PullRequest")) }
      
          it "should know its event type" do
            expect(subject.event_type).to eq(:pull_request)
          end
          
          it "should include data in message" do
            payload = fixture_file("pull_request")
            hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::PullRequest.new(robot, payload)
            expect{
              expect(PullRequestListener.new(hook).message).to match(hook.url)
            }.not_to raise_error
          end
  
        end
      end
    end
  end
end