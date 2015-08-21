module Lita::Extensions
  module GitHubWebHooksCore::Hooks::RepoHooks
    def repository
      payload["repository"]
    end
  
    def repo
      repository["full_name"]
    end
    
    def client
      client = Octokit::Client.new(access_token: access_token)      
    end
    
    def access_token
      t = ENV["GITHUB_ACCESS_TOKEN"]
      if t.nil?
        raise ArgumentError.new("Configure your GitHub API use via the GITHUB_ACCESS_TOKEN env variable")
      end
      t
    end
    
  end
end
