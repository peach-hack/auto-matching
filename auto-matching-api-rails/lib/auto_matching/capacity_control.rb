module AutoMatching
  module CapacityControl
    def delete_extra_posts
      puts "--- Post Table Count ---"
      capacity = Post.count
      puts "Post DB Count ---> #{capacity}"

      if capacity > 7000
        all_delete_no = 0
        only_delete_no = 0
        all_delete_list = []
        only_delete_list = []
        ago_post = Post.where("post_at < ?", 1.week.ago)
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

        all_delete_id = all_delete_list.join(",").chop!
        only_delete_id = only_delete_list.join(",").chop!

        all_delete_profile_sql = "DELETE FROM PROFILES WHERE ID IN (#{all_delete_id})"
        all_delete_post_sql = "DELETE FROM POSTS WHERE PROFILE_ID IN (#{all_delete_id})"
        only_delete_post_sql = "DELETE FROM POSTS WHERE ID IN (#{only_delete_id})"

        if all_delete_list.present?
          Profile.find_by_sql(all_delete_profile_sql)
          Post.find_by_sql(all_delete_post_sql)
        end

        Post.find_by_sql(only_delete_post_sql) if only_delete_id.present?

        puts "Posts before 7 days ago -------------------> #{posts_before_7days_ago}"
        puts "Number of all(Profile & Post) deletions ---> #{all_delete_no}"
        puts "Number of only(Post) deletions ------------> #{only_delete_no}"
      end
    end
  end
end
