# frozen_string_literal: true

require "yaml"

post_file = "db/templates/post.yml"

posts = []

if File.exist?(post_file)
  posts = YAML.load_file(post_file)
end

unless posts
  posts = []
end

posts.each_with_index do |post, i|
  PostTemplate.seed do |p|
    p.id = i
    p.title = post["title"]
    p.body = post["body"]
  end
end
