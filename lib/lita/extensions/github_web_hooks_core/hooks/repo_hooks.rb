module Lita::Extensions
  module GitHubWebHooksCore::Hooks::RepoHooks
    def repository
      payload["repository"]
    end
  
    def repo
      repository["full_name"]
    end
  end
end
