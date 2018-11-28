# frozen_string_literal: true

require "yaml"

posts = YAML.load_file("db/templates/post.yml")
posts.each do |post|
  Post.seed do |p|
    p.title = post["title"]
    p.body = post["body"]
  end
end
