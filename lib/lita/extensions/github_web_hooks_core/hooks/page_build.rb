module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class PageBuild < Hook
      end
    end
    Configuration.register_hook("page_build", GitHubWebHooksCore::Hooks::PageBuild)
  end
end
