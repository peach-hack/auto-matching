# frozen_string_literal: true

require "yaml"

post_file = "db/templates/post.yml"

if File.exist?(post_file)
  posts = YAML.load_file(post_file)
else
  posts = []
end

posts.each_with_index do |post, i|
  Post.seed do |p|
    p.id = i
    p.title = post["title"]
    p.body = post["body"]
  end
end
