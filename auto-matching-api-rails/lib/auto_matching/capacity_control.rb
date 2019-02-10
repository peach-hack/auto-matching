module AutoMatching
  module CapacityControl
    def delete_extra_posts
      logger.debug("--- Post Table Count ---")
      capacity = Post.count
      logger.debug("Post DB Count ---> #{capacity}")

      if capacity > 7000
        posts = Post.where('post_at < ?', 7.day.ago)
        posts.delete_all
      end
    end
  end
end