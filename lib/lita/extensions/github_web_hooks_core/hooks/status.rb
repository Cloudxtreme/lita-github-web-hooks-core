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
      class Status < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def sha
          payload["sha"]
        end

        def status
          payload["state"]
        end

        def context
          payload["context"]
        end

        def description
          payload["description"]
        end

        def attributes
          {
            sha: sha,
            context: context,
            description: description,
            repo: repo,
            status: status
          }
        end
      end
    end
  end
end
