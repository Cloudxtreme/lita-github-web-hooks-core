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

require 'octokit'
require "netaddr"

module Lita
  module Extensions
    class GithubWebHooksCore

    end

    # If your extension needs to register with a Lita hook, uncomment the
    # following line and change the hook name to the appropriate value:
    # Lita.register_hook(:hook_name, GithubWebHooksCore)
  end
end

require "lita/extensions/github_web_hooks_core/hook_receiver"
require "lita/extensions/github_web_hooks_core/hooks"