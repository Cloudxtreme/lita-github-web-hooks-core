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
  module GitHubWebHooksCore::Hooks::RepoHooks
    def repository
      payload["repository"]
    end

    def repo
      repository["full_name"]
    end

    def client
      client = Octokit::Client.new(access_token: access_token)
    end

    def access_token
      t = ENV["GITHUB_ACCESS_TOKEN"]
      if t.nil?
        raise ArgumentError.new("Configure your GitHub API use via the GITHUB_ACCESS_TOKEN env variable")
      end
      t
    end

  end
end
