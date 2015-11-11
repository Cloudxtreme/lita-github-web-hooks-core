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

require "lita/extensions/github_web_hooks_core/hooks/hook"
require "lita/extensions/github_web_hooks_core/hooks/repo_hooks"
require "lita/extensions/github_web_hooks_core/hooks/commit_comment"
require "lita/extensions/github_web_hooks_core/hooks/create"
require "lita/extensions/github_web_hooks_core/hooks/delete"
require "lita/extensions/github_web_hooks_core/hooks/deployment"
require "lita/extensions/github_web_hooks_core/hooks/deployment_status"
require "lita/extensions/github_web_hooks_core/hooks/download"
require "lita/extensions/github_web_hooks_core/hooks/follow"
require "lita/extensions/github_web_hooks_core/hooks/fork_apply"
require "lita/extensions/github_web_hooks_core/hooks/fork"
require "lita/extensions/github_web_hooks_core/hooks/gist"
require "lita/extensions/github_web_hooks_core/hooks/gollum"
require "lita/extensions/github_web_hooks_core/hooks/issue_comment"
require "lita/extensions/github_web_hooks_core/hooks/issues"
require "lita/extensions/github_web_hooks_core/hooks/member"
require "lita/extensions/github_web_hooks_core/hooks/membership"
require "lita/extensions/github_web_hooks_core/hooks/page_build"
require "lita/extensions/github_web_hooks_core/hooks/ping"
require "lita/extensions/github_web_hooks_core/hooks/public"
require "lita/extensions/github_web_hooks_core/hooks/pull_request"
require "lita/extensions/github_web_hooks_core/hooks/pull_request_review_comment"
require "lita/extensions/github_web_hooks_core/hooks/push"
require "lita/extensions/github_web_hooks_core/hooks/release"
require "lita/extensions/github_web_hooks_core/hooks/repository"
require "lita/extensions/github_web_hooks_core/hooks/status"
require "lita/extensions/github_web_hooks_core/hooks/team_add"
require "lita/extensions/github_web_hooks_core/hooks/watch"