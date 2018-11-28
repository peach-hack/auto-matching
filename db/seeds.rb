seed_files = []
seed_files << 'reset.rb'
seed_files << 'source_site.rb'
seed_files << 'post.rb'

Dir.glob(File.join(Rails.root, "db", "seeds", "*.rb")) do |file|
  basename = File.basename(file)
  next if seed_files.include?(basename)
  seed_files << basename
end

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
