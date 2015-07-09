require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe PageBuildListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a PageBuild hook" do
        expect{
          PageBuildListener.new(double("PageBuild"))
        }.not_to raise_error
      end
      
      subject{ PageBuildListener.new(double("PageBuild")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:page_build)
      end
          
      it "should render message" do
        payload = fixture_file("page_build")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::PageBuild.new(robot, payload)
        expect{
          expect(PageBuildListener.new(hook).message).to match(hook.status)
        }.not_to raise_error
      end
  
    end
  end
end
