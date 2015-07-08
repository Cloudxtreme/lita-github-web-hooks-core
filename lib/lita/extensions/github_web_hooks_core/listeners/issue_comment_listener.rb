module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        class IssueCommentListener < BaseListener
          
          event_type :issue_comment
      
        end
      end
    end
  end
end