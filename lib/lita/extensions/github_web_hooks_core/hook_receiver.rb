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

          # FIXME: github_cidrs has been null in prod?
          validity = github_cidrs.any? do |cidr|
            ::NetAddr::CIDR.create(cidr).contains?(ip)
          end

          Lita.logger.warn("GitHub web hook received from invalid IP: #{ip}") unless validity
          validity
        end
      end
    end
  end
end