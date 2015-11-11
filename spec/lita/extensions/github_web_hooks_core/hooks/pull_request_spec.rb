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

require 'spec_helper'

module Lita::Extensions::GitHubWebHooksCore::Hooks
  describe PullRequest do

    let(:payload){ fixture_file("pull_request") }

    subject{ PullRequest.new(payload) }

    context "data collection" do
      it "should gather information on originator" do
        expect(subject.requester).not_to be_nil
      end
      it "should gather information about the target branch" do
        expect(subject.target_branch).not_to be_nil
      end
      it "should gather information about the candidate branch" do
        expect(subject.candidate_branch).not_to be_nil
      end
      it "should gather information about the repo" do
        expect(subject.repo).not_to be_nil
      end
      it "should gather information about the ref" do
        expect(subject.ref).not_to be_nil
      end
      it "should expose the performed action" do
        expect(subject.action).not_to be_nil
      end

    end

  end
end