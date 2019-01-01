class OptionsRequestController < ApplicationController
  ACCESS_CONTROL_ALLOW_METHODS = %w(GET OPTIONS).freeze
  ACCESS_CONTROL_ALLOW_HEADERS = %w(Accept Origin Content-Type Authorization).freeze

  def preflight
    set_preflight_headers!
    head :ok
  end

  private

    def set_preflight_headers!
      response.headers["Access-Control-Max-Age"] = ACCESS_CONTROL_MAX_AGE
      response.headers["Access-Control-Allow-Headers"] = ACCESS_CONTROL_ALLOW_HEADERS.join(",")
      response.headers["Access-Control-Allow-Methods"] = ACCESS_CONTROL_ALLOW_METHODS.join(",")
    end
end
