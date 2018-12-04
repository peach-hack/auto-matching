# frozen_string_literal: true

require "yaml"

posts = YAML.load_file("db/templates/post.yml") || []

posts.each_with_index do |post, i|
  Post.seed do |p|
    p.id = i
    p.title = post["title"]
    p.body = post["body"]
  end
end
