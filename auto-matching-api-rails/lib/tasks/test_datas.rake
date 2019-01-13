# frozen_string_literal: true

module TestDatas
  extend Rake::DSL
  extend self

  namespace :test_datas do
    task all: :environment do |_task, _args|
      [
          "rails test_datas:reset_all",
          "rails test_datas:create_source_sites",
          "rails test_datas:create_posts"
      ].each do |task|
        sh task
      end
    end

    task reset_all: :environment do |_task, _args|
      return if disable_env?
      reset_all
    end

    task create_source_sites: :environment do |_task, _args|
      return if disable_env?
      10.times do |t|
        create_source_site
      end
    end

    task create_posts: :environment do | _task, _args|
      return if disable_env?

      1000.times do |t|
        create_post_and_profile
      end
    end

    def create_source_site
      FactoryBot.create(:source_site)
    end

    def create_post_and_profile
      FactoryBot.create(:post)
    end

    def reset_all
      return if disable_env?

      SourceSite.delete_all
      Post.delete_all
      Profile.delete_all
    end

    def disable_env?
      allow_env = %i(development test)
      !allow_env.include?(Rails.env.to_sym)
    end
  end
end
