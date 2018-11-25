seed_files = []
seed_files << 'reset.rb'
seed_files << 'source_site.rb'

# seedsフォルダを検索して実行するファイルを追加
Dir.glob(File.join(Rails.root, "db", "seeds", "*.rb")) do |file|
  basename = File.basename(file)
  next if seed_files.include?(basename)
  seed_files << basename
end

# SEEDを実行
seed_files.each do |basename|
  file = File.join(Rails.root, "db", "seeds", basename)
  # puts "#{basename} seed creating ..."
  print "."
  begin
    load(file)
  rescue => e
    puts ""
    puts "#{basename} seed has error => #{e}"
  end
end

puts ""
