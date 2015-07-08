require 'spec_helper'

module Lita
  module Extensions
    module GitHubWebHooksCore
      describe Configuration, lita: true do
        let(:file){ config_file }
        context "reading" do
          it "should be readable from the filesystem" do
            expect{ Configuration.read(file) }.not_to raise_error          
          end
          it "should return many listeners" do
            expect( Configuration.read(file) ).not_to be_empty
          end
        end
        context "publicly exposed" do
          before(:each) do
            Configuration.read(file)
          end
          subject{ Configuration.config }
          it "should have at least two listeners" do
            expect(subject.length > 2).to be
          end
        end
        context "inspection" do
        
          before(:each) do
            Configuration.read(file)
          end
        
          it "should qualify a listener on repo name" do
            listener = double("Listener", repo: "henryhacker/public_repo", event_type: "deployment")
            hook = double("Deployment", event_type: "deployment")
            expect(listener).to receive(:hook){ hook }
            expect(Configuration.for(listener)).not_to be_empty
          end
          it "should not discriminate on symbolic event type" do
            listener = double("Listener", repo: "henryhacker/public_repo", event_type: :deployment)
            hook = double("Deployment", event_type: "deployment")
            expect(listener).to receive(:hook){ hook }              
            expect(Configuration.for(listener)).not_to be_empty
          end
          pending "should permit multiple event types" do
            listener = double("Listener", repo: "henryhacker/public_repo", event_type: [:deployment_status, :deployment])
            hook = double("Deployment", event_type: "deployment")
            expect(listener).to receive(:hook){ hook }              
            expect(Configuration.for(listener)).not_to be_empty
          end        
          it "should disqualify a listener on repo name" do
            listener = double("Listener", repo: "henryhacker/private_repo")
            expect(Configuration.for(listener)).to be_empty
          end
          it "should disqualify a listener when only excludes" do
            listener = double("Listener", repo: "henryhacker/public_repo", event_type: "pull_request")
            expect(Configuration.for(listener)).to be_empty
          end
          it "should disqualify a listener when except includes" do
            listener = double("Listener", repo: "henryhacker/third_public_repo", event_type: "commit_comment")
            expect(Configuration.for(listener)).to be_empty              
          end
          it "should disqualify a listener when not of correct event type" do
            listener = double("Listener", repo: "henryhacker/public_repo", event_type: :deployment)
            hook = double("DeploymentStatus", event_type: "deployment_status")
            expect(listener).to receive(:hook){ hook }              
            expect(Configuration.for(listener)).to be_empty              
          end
        end
      end
    end
  end
end