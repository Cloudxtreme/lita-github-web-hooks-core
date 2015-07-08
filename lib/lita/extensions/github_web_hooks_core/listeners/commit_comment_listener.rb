module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        class CommitCommentListener < BaseListener
          
          event_type :commit_comment
      
        end
      end
    end
  end
end