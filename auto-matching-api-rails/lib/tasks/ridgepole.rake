module RidgePole
  extend Rake::DSL
  extend self

  namespace :ridgepole do
    desc "Apply database schema"
    task apply: :environment do
      ridgepole("--apply", "--file #{schema_file}")
    end

    desc "Export database schema"
    task export: :environment do
      ridgepole("--export", "--split", "--output #{schema_file}")
      write_top_of_file("Encoding.default_external = 'UTF-8'", schema_file)
    end

    private

      def write_top_of_file(data, filename)
        lines = []
        File.foreach(filename) do |line|
          lines << line.chomp
        end
        lines.unshift(data)
        lines.flatten!
        File.open(filename, "r+") do |f|
          lines.each do |url|
            f.puts url
          end
        end
      end

      def schema_file
        Rails.root.join("db/schemas/Schemafile")
      end

      def config_file
        Rails.root.join("config/database.yml")
      end

      def ridgepole(*options)
        command = ["bundle exec ridgepole", "--config #{config_file}", "-E #{Rails.env}"]
        system [command + options].join(" ")

        unless Rails.env.production?
          Rake::Task["db:schema:dump"].invoke
          Rake::Task["db:test:prepare"].invoke
          Rails.root.join("db/schema.rb").delete
        end
      end
  end
end
