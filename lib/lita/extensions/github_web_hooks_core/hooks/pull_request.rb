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
      class PullRequest < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def requester
          payload["sender"]
        end

        def pr
          payload["pull_request"]
        end

        def title
          pr["title"]
        end

        def number
          pr["number"]
        end

        def target_branch
          pr["base"]["label"].split(":").last
        end

        def candidate_branch
          pr["head"]["label"].split(":").last
        end

        def url
          pr["html_url"]
        end

        def ref
          pr["head"]["ref"]
        end

        def sha
          pr["head"]["sha"]
        end

        def action
          payload["action"]
        end

        def opened?
          action == "opened"
        end

        def synchronized?
          action == "synchronize"
        end

        def closed?
          action == "closed"
        end

        def merged?
          closed? && pr["merged"]
        end

        def attributes
          {requester: requester,
            pr: pr,
            target_branch: target_branch,
            candidate_branch: candidate_branch,
            url: url
          }
        end

        def set_status(status, options={})
          return if status.nil? || options[:target_url].nil?
          options[:context] ||= "lita"
          client.create_status(self.repo, self.sha, status, options)
        end

        def to_s
          if merged?
            "[#{self.repo}] #{self.requester["login"]} has merged #{candidate_branch} to #{target_branch} and #{self.action} pull request ##{self.number}: #{self.title}"
          else
            "[#{self.repo}] #{self.requester["login"]} has #{self.action} pull request ##{self.number}: #{self.title}: #{self.url}"
          end
        end
      end
    end
  end
end
