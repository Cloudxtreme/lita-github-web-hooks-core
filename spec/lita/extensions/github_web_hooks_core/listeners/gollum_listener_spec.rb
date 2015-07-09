require 'spec_helper'

module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    describe GollumListener, lita: true do
          
      let(:robot){ Lita::Robot.new(registry) }
      it "should initialize with a Gollum hook" do
        expect{
          GollumListener.new(double("Gollum"))
        }.not_to raise_error
      end
      
      subject{ GollumListener.new(double("Gollum")) }
      
      it "should know its event type" do
        expect(subject.event_type).to eq(:gollum)
      end
          
      it "should render message" do
        payload = fixture_file("gollum")
        hook = ::Lita::Extensions::GitHubWebHooksCore::Hooks::Gollum.new(robot, payload)
        expect{
          expect(GollumListener.new(hook).message).to match(hook.url)
        }.not_to raise_error
      end
  
    end
  end
end
