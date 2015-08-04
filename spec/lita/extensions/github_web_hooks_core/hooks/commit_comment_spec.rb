require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe CommitComment do
  
    let(:payload){ fixture_file("commit_comment") }
  
    subject{ CommitComment.new(payload) }
  
    context "data collection" do
      it "should supply commenter" do
        expect(subject.commenter).not_to be_nil
      end
      it "should expose comment body" do
        expect(subject.body).not_to be_nil
      end
      it "should expose url" do
        expect(subject.url).not_to be_nil
      end
    end
  
  end
end