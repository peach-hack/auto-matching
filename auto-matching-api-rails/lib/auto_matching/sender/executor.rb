# frozen_string_literal: true

module AutoMatching
  module Sender
    class Executor
      def run(sender_class)
        run_sender(sender_class)
      end

    private
      def run_sender(sender_class)
        start_time = Time.now

        post = sample_first_post
        sender_class.new(post: post).run
        end_time = Time.now

        p "end.(#{end_time - start_time}s)"
      end

      def sample_first_post
        PostTemplate.offset(rand(PostTemplate.count)).first
      end
    end
  end
end
