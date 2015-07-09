module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class CommitCommentListener < BaseListener
          
      event_type :commit_comment
      
    end
  end
end