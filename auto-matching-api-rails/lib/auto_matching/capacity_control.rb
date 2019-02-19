module AutoMatching
  module CapacityControl
    CAPACITY_MAX = 7000

    def delete_extra_posts
      puts "--- Post Table Count ---"
      capacity = Post.count + Profile.count
      puts "Post DB Count ---> #{capacity}"

      if capacity > CAPACITY_MAX
        all_delete = 0
        only_delete = 0
        ago_post = Post.where("post_at < ?", 5.days.ago)
        posts_before_7days_ago = ago_post.count
        ago_post.each do |b|
          if Post.where(profile_id: b.profile_id).count == 1
            all_delete += 1
            Profile.find(b.profile_id).destroy
          else
            only_delete += 1
            b.delete
          end
        rescue => e
          puts "--ActiveRecord::RecordNotFound--"
          puts e
        end
        puts "Posts before 7 days ago -------------------> #{posts_before_7days_ago}"
        puts "Number of all(Profile & Post) deletions ---> #{all_delete}"
        puts "Number of only(Post) deletions ------------> #{only_delete}"
      end
    end
  end
end
