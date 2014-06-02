require 'borrower'
require 'uglifier'
require 'sass'
require 'coffee-script'

Borrower.manifest do |m|
  m.dir "assets/css/_src"
  m.dir "assets/scripts/_src"
end

namespace :assets do

  desc 'asset tasks that require compiling files'
  namespace :compile do

    desc "compile sass files"
    task :sass do
      app_sass_dir       = 'assets/css/_src'

      Sass.load_paths << app_sass_dir

      stylesheets = Dir[ File.join( app_sass_dir, '*.css.scss') ].map { |f| f.scan(/(?:.*)\/(.+?).css.scss/)[0][0] }

      stylesheets.each do |sheet|
        puts "compiling #{sheet}.css"
        borrow "#{sheet}.css.scss", to: "assets/css/#{sheet}.css" do |source|
          Sass.compile( source, style: :compressed )
        end
      end

    end

    desc "merge & compile javascripts"
    task :scripts do

      scripts       = Dir['assets/scripts/_src/*.js'].map { |f| f.scan(/(?:.*)\/(.+?).js/)[0][0] }
      coffeescripts = Dir['assets/scripts/_src/*.js.coffee'].map { |f| f.scan(/(?:.*)\/(.+?).js.coffee/)[0][0] }

      scripts.each do |script|
        puts "compiling #{script}.js"
        borrow "#{script}.js", to: "assets/scripts/#{script}.min.js", merge: true, type: 'js' do |source|
          Uglifier.compile source
        end
      end

      coffeescripts.each do |script|
        puts "compiling #{script}.js"
        borrow "#{script}.js", to: "assets/scripts/#{script}.min.js", merge: true do |source|
          Uglifier.compile CoffeeScript.compile(source)
        end
      end

    end

  end

end