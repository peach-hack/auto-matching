# frozen_string_literal: true

module Db
  extend Rake::DSL
  extend self

  namespace :db do
    desc "Run RAILS_ENV=#{Rails.env} db:drop, db:create, ridgepole:apply, db:seed_fu"
    task :recovery do
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:drop"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:create"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails ridgepole:apply"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:seed_fu"
    end

    desc "Run RAILS_ENV=#{Rails.env} ridgepole:apply, db:seed_fu"
    task :prepare do
      sh "RAILS_ENV=#{Rails.env} bundle exec rails ridgepole:apply"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:seed_fu"
    end
  end
end
