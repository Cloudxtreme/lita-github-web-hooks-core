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
      class IssueComment < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def body
          comment["body"]
        end

        def comment
          payload["comment"]
        end

        def commenter
          payload["sender"]["login"]
        end

        def url
          comment["html_url"]
        end

        def issue
          payload["issue"]
        end

        def number
          issue["number"]
        end

        def target
          issue["title"]
        end

        def attributes
          {
            body: body,
            comment: comment,
            commenter: commenter,
            number: number,
            repo: repo,
            url: url,
            issue: issue,
            target: target
          }
        end
      end
    end
  end
end
