# Copyright 2015 Levvel, LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
#    limitations under the License.

module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class PullRequestReviewComment < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def requester
          payload["sender"]
        end

        def pr
          payload["pull_request"]
        end

        def target_branch
          pr["base"]["label"]
        end

        def candidate_branch
          pr["head"]["label"]
        end

        def url
          pr["html_url"]
        end

        def body
          comment["body"]
        end

        def comment
          payload["comment"]
        end

        def commenter
          payload["sender"]["login"]
        end

        def path
          comment["path"]
        end

        def number
          pr["number"]
        end

        def ref
          pr["ref"]
        end

        def attributes
          {
            requester: requester,
            pr: pr,
            repo: repo,
            ref: ref,
            path: path,
            number: number,
            target_branch: target_branch,
            candidate_branch: candidate_branch,
            url: url,
            body: body,
            comment: comment,
            commenter: commenter
          }
        end
      end
    end
  end
end
