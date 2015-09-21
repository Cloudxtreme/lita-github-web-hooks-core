require "spec_helper"

describe Lita::Extensions::GithubWebHooksCore, lita: true do
  it 'has a version number' do
    expect(Lita::Github::WebHooks::Core::VERSION).not_to be nil
  end
  
end
