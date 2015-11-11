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

module Lita
  module Extensions
    module GitHubWebHooksCore
      class HookReceiver < Handler

        def logger
          Lita.logger
        end

        def receive_hook(request, response)
          event_type = event_type_from_request(request)
          logger.debug("Received #{event_type} webhook")
          if valid?(request)
            payload = extract_payload(request)
            robot.trigger(event_type, payload.merge(event_type: event_type))
          end

          response.status = 202
        end

        private

        def event_type_from_request(request)
          request.env["HTTP_X_GITHUB_EVENT"]
        end

        def extract_payload(request)
          case (media_type = request.media_type)
          when "application/x-www-form-urlencoded"
            MultiJson.load(request["payload"])
          when "application/json"
            MultiJson.load(request.body)
          else
            raise "GitHub web hooks: Invalid HTTP Content-Type header: #{media_type}"
          end
        end

        def github_cidrs
          response = http.get("https://api.github.com/meta")
          data = MultiJson.load(response.body)
          data["hooks"]
        end

        def valid?(request)
          valid_content_type?(request) && valid_ip?(request)
        end

        def valid_content_type?(request)
          validity = request.media_type == "application/json"
          Lita.logger.warn(
            "GitHub web hook received with invalid media type: #{request.media_type}"
          ) unless validity
          validity
        end

        def valid_ip?(request)
          ip = request.ip
          cidrs = github_cidrs || [ "192.30.252.0/22" ]

          # FIXME: github_cidrs has been null in prod?
          # FIXME: this behaves poorly behind a NAT firewall, allow a whitelist
          validity = cidrs.any? do |cidr|
            ::NetAddr::CIDR.create(cidr).contains?(ip)
          end

          Lita.logger.warn("GitHub web hook received from invalid IP: #{ip}") unless validity
          validity
        end
      end
    end
  end
end