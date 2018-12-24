module AutoMatching
  module Checker
    class Wakuwaku < CheckerBase
      include Common::Wakuwaku
      class << self
        source_site_key
      end
    end
  end
end
