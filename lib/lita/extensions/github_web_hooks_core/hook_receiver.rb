module Lita
  module Extensions
    module GitHubWebHooksCore
      class HookReceiver < Handler

        def receive_hook(request, response)
          if valid?(request)
            event_class = event_class_from_request(request)
            payload = extract_payload(request)
            event_class.new(robot, payload).call
          end

          response.status = 202
        end

        private

        def event_class_from_request(request)
          GitHubWebHooks.hooks[event_type_from_request(request)]
        end

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
          valid_event_type?(request) && valid_ip?(request)
        end

        def valid_content_type?(request)
          validity = request.media_type == "application/json"
          Lita.logger.warn(
            "GitHub web hook received with invalid media type: #{request.media_type}"
          ) unless validity
          validity
        end

        def valid_event_type?(request)
          validity = !event_class_from_request(request).nil?
          Lita.logger.warn(
            "GitHub web hook received with invalid event: #{event_type_from_request(request)}"
          ) unless validity
          validity
        end

        def valid_ip?(request)
          ip = request.ip

          validity = github_cidrs.any? do |cidr|
            NetAddr::CIDR.create(cidr).contains?(ip)
          end

          Lita.logger.warn("GitHub web hook received from invalid IP: #{ip}") unless validity
          validity
        end
      end
    end
  end
end