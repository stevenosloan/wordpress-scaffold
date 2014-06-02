require 'borrower'

desc 'package theme for deployment'
task :build do
  # file whitelist
  file_list = []

  # add root files
  file_list.push *['.htaccess', 'index.php', 'functions.php', 'screenshot.png', 'style.css', 'favicon.ico' ]

  # add dir files
  file_list.push *Dir[ 'assets/**/*', 'layouts/**/*', 'config/**/*', 'lib/**/*', 'views/**/*' ]

  # move files to release
  file_list.each do |file|
    next if File.directory? file

    puts "copying #{file}"
    borrow file, to: "release/#{file}"
  end

  # change env to production
  borrow 'release/config/env.php', to: 'release/config/env.php' do |contents|
    contents.gsub("development", "production")
  end
end