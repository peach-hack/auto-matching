module AutoMatching
  module Sender
    class Executor
      def run(sender_class)
        run_sender(sender_class)
      end

      private
        def run_sender(sender_class)
          post = sample_first_post
          sender_class.new(post: post).run
        end

        def sample_first_post
          PostTemplate.offset(rand(PostTemplate.count)).first
        end
    end
  end
end
