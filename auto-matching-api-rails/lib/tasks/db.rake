# frozen_string_literal: true

module Db
  extend Rake::DSL
  extend self

  namespace :db do
    desc "Run RAILS_ENV=#{Rails.env} db:drop, db:create, db:migrate, db:seed_fu."
    task :recovery do
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:drop"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:create"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:migrate"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:seed_fu"
    end
  end
end
