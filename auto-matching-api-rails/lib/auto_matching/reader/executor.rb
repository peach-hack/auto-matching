module AutoMatching
  module Reader
    class Executor
      def run(klass, area_list, genre_list)
        runner = klass.new
        runner.run
      end
    end
  end
end
