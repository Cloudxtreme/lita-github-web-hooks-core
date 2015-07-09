module Lita::Extensions
  module GitHubWebHooksCore::Listeners
    class PullRequestReviewCommentListener < BaseListener
          
      event_type :pull_request_review_comment
      
    end
  end
end
