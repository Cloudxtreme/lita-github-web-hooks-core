require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe RepositoryListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Repository hook" do
        expect{
          RepositoryListener.new(double("Repository"))
        }.not_to raise_error
      end
      
      subject{ RepositoryListener.new(double("Repository")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:repository)
      end
          
      it "should render message" do
        payload = fixture_file("repository")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Repository.new(robot, payload)
        expect{
          expect(RepositoryListener.new(hook).message).to match(hook.repo)
        }.not_to raise_error
      end
  
    end
  end
end
