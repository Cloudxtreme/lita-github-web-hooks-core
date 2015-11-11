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

    let(:payload){ fixture_file("issue_comment") }

    subject{ IssueComment.new(payload) }

    context "data collection" do
      it "should supply commenter" do
        expect(subject.commenter).not_to be_nil
      end

      it "should supply body" do
        expect(subject.body).not_to be_nil
      end

      it "should supply url" do
        expect(subject.url).not_to be_nil
      end

      it "should supply target" do
        expect(subject.target).not_to be_nil
      end

    end

  end
end