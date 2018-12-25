module AutoMatching
  module Checker
    class Executor
      def run(klass)
        klass.new.run
      end
    end
  end
end
