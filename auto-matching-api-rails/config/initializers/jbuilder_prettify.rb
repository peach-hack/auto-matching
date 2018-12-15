# Pretty prints JSON so it's nicer to read in the browser
# while demonstrating API responses.

require "jbuilder"

if Rails.env.development? && MultiJson.default_adapter == :json_gem
  class Jbuilder
    def target!
      ::JSON.pretty_generate(@attributes)
    end
  end
end
