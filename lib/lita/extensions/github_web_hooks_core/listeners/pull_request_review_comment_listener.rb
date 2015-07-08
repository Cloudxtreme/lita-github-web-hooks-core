module Lita
  module Extensions
    module GitHubWebHooksCore
      module Listeners
        class PullRequestReviewCommentListener < BaseListener
          
          event_type :pull_request_review_comment
      
        end
      end
    end
  end
end