require "thor"
require "wordpress-view_controller"

module Wordpress
  module ViewController
    module Cli

      class Base < Thor

        desc "version", "display version"
        def version
          say "Wordpress::ViewController #{Wordpress::ViewController::VERSION}"
        end

      end

    end
  end
end