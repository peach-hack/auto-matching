module AutoMatching
  module CapacityControl
    def capacity_control_DB
      puts "--- Post Table Count ---"
      capacity = Post.count
      puts "Post DB Count ---> #{capacity}"

      if capacity > 7000
        posts = Post.where('post_at < ?', 7.day.ago)
        posts.delete_all
      end
    end
  end
end