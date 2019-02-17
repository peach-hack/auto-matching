module AutoMatching
  module CapacityControl
    def delete_extra_posts
      puts "--- Post Table Count ---"
      capacity = Post.count
      puts "Post DB Count ---> #{capacity}"

      if true # capacity > 7000
        all_delete_no = 0
        only_delete_no = 0
        all_delete_list = []
        only_delete_list = []
        ago_post = Post.where("post_at < ?", 1.week.ago)
        posts_before_7days_ago = ago_post.count
        ago_post.each do |b|
          if Post.where(profile_id: b.profile_id).nil?
            # 何もしない
          elsif Post.where(profile_id: b.profile_id).count == 1
            all_delete_no += 1
            all_delete_list.push(Profile.find(b.profile_id).id)
            # Profile.find(b.profile_id).destroy => 前の処理のため一旦コメントアウト
          elsif Post.where(profile_id: b.profile_id).count > 1
            only_delete_no += 1
            only_delete_list.push(b.id)
            # b.delete => 前の処理のため一旦コメントアウト
          end
        end
        all_delete_id = ""
        only_delete_id = ""
        all_delete_list.map { |v| all_delete_id << v.to_s + "," }
        only_delete_list.map { |v| only_delete_id << v.to_s + "," }
        all_delete_id.chop!
        only_delete_id.chop!

        puts "\n\n"
        puts "-- all_delete_list --"
        puts all_delete_list
        puts "-- only_delete_list --"
        puts only_delete_list
        puts "-- all_delete_id --"
        puts all_delete_id
        puts "-- only_delete_id --"
        puts only_delete_id
        puts "\n\n"
        all_delete_profile_sql = "DELETE FROM PROFILES WHERE ID IN (#{all_delete_id})"
        all_delete_post_sql = "DELETE FROM POSTS WHERE PROFILE_ID IN (#{all_delete_id})"
        only_delete_post_sql = "DELETE FROM POSTS WHERE ID IN (#{only_delete_id})"

        if all_delete_list
          Profile.find_by_sql(all_delete_profile_sql)
          Post.find_by_sql(all_delete_post_sql)
        end

        Post.find_by_sql(only_delete_post_sql) if only_delete_id

        # Profile.destroy(all_delete_list) if all_delete_list => 前の処理のため一旦コメントアウト
        # Post.delete(only_delete_list) if only_delete_list => 前の処理のため一旦コメントアウト
        puts "Posts before 7 days ago -------------------> #{posts_before_7days_ago}"
        puts "Number of all(Profile & Post) deletions ---> #{all_delete_no}"
        puts "Number of only(Post) deletions ------------> #{only_delete_no}"
      end
    end
  end
end
