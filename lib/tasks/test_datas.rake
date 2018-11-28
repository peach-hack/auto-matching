module TestDatas
  extend Rake::DSL
  extend self

  namespace :test_datas do
    desc "テストデータ全てを作成"
    task all: :environment do |_task, _args|
      [
          "rails test_datas:reset_all",
          "rails test_datas:create_source_sites",
      ].each do |task|
        sh task
      end
    end

    desc "テストデータをリセット"
    task reset_all: :environment do |_task, _args|
      return if disable_env?
      reset_all
    end

    desc "ソースサイト"
    task create_source_sites: :environment do |_task, _args|
      return if disable_env?
      10.times do |t|
        create_source_site
      end
    end

    def create_source_site
      FactoryBot.create(:source_site)
    end

    def reset_all
      return if disable_env?

      SourceSite.delete_all
    end

    def disable_env?
      allow_env = %i(development test)
      !allow_env.include?(Rails.env.to_sym)
    end
  end
end
