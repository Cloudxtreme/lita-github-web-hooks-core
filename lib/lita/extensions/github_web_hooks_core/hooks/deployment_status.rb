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
      class DeploymentStatus < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def status
          payload["deployment_status"]["state"]
        end

        def deployment_description
          [deploy["description"], status].join(": ")
        end

        def sha
          deploy["sha"]
        end

        def environment
          deploy["environment"]
        end

        def start_time
          deploy["created_at"]
        end

        def deploy
          payload["deployment"]
        end

        def deployer
          payload["sender"]["login"]
        end

        def ref
          deploy["ref"]
        end

        def attributes
        {
          status: status,
          deployment_description: deployment_description,
          ref: ref,
          repo: repo,
          sha: sha,
          environment: environment,
          start_time: start_time,
          deploy: deploy,
          deployer: deployer
        }
        end
      end
    end
  end
end
