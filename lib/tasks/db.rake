module Db
  extend Rake::DSL
  extend self

  namespace :db do
    desc "Run RAILS_ENV=#{Rails.env} db:drop, db:create, db:migrate, db:seed."
    task :recovery do
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:drop"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:create"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:migrate"
      sh "RAILS_ENV=#{Rails.env} bundle exec rails db:seed"
    end

    def with_logging(task_name)
      Rails.logger.info "[task]#{env_label} Start #{task_name} at #{Time.now.to_s(:db)}"
      begin
        if Rails.env.production?
          Rails.logger.info "[task]#{env_label} Executing #{task_name} for production is not allowed."
        end
        Rails.logger.info "[task]#{env_label} End #{task_name} at #{Time.now.to_s(:db)}. #{yield}"
      rescue => ex
        Rails.logger.error "[task]Error in #{task_name}. error=#{ex} at #{Time.now.to_s(:db)}"
      end
    end

    def env_label
      "[#{Rails.env}]"
    end
  end
end
