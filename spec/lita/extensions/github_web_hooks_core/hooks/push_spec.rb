require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe Push do
  
    let(:payload){ fixture_file("push") }
  
    subject{ Push.new(payload) }
  
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