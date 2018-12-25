module AutoMatching
  module Reader
    class Executor
      def run(klass)
        run_reader(klass)
      end

      private
        def run_reader(klass)
          start_time = Time.now
          klass.new.run
          end_time = Time.now

          p "end.(#{end_time - start_time}s)"
        end
    end
  end
end
