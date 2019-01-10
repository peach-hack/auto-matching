module AutoMatching
  module Reader
    class Executor
      def run(klass)
        run_reader(klass)
      end

      private
        def run_reader(klass)
          klass.new.run
        end
    end
  end
end
