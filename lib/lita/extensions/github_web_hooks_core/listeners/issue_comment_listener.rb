module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class IssueCommentListener < BaseListener
          
      event_type :issue_comment
      
    end
  end
end
