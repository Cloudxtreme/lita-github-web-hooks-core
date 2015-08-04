require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe Deployment do
  
    let(:payload){ fixture_file("deployment") }
  
    subject{ Deployment.new(payload) }
  
    context "data collection" do
      it "should supply SHA" do
        expect(subject.sha).not_to be_nil
      end
    end

  end
end