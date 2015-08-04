require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe Status do
  
    let(:payload){ fixture_file("status") }
  
    subject{ Status.new(payload) }
  
    context "data collection" do
      it "should supply status" do
        expect(subject.status).not_to be_nil
      end
      it "should expect sha" do
        expect(subject.sha).not_to be_nil
      end
    end
  
  end
end