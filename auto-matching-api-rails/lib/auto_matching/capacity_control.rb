module AutoMatching
  module CapacityControl
    CAPACITY_MAX = 7000

    def delete_extra_posts
      puts "--- Post Table Count ---"
      capacity = Post.count + Profile.count
      puts "Post DB Count ---> #{capacity}"


      if capacity > CAPACITY_MAX
        all_delete_no = 0
        only_delete_no = 0
        all_delete_list = []
        only_delete_list = []
        ago_post = Post.where("post_at < ?", 5.days.ago)
        posts_before_7days_ago = ago_post.count

        ago_post.each do |b|
          post_count = Post.where(profile_id: b.profile_id).count
          if post_count == 0
            # 何もしない
          elsif post_count == 1
            all_delete_no += 1
            all_delete_list.push(Profile.find(b.profile_id).id)
          elsif post_count > 1
            only_delete_no += 1
            only_delete_list.push(b.id)
          end
        end

        if all_delete_list.present?
          Profile.destroy(all_delete_list)
        end

        if only_delete_list.present?
          Post.destroy(only_delete_list)
        end

        puts "Posts before 7 days ago -------------------> #{posts_before_7days_ago}"
        puts "Number of all(Profile & Post) deletions ---> #{all_delete_no}"
        puts "Number of only(Post) deletions ------------> #{only_delete_no}"
      end
    end
  end
end
