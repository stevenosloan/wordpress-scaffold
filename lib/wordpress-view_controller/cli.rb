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

        desc "scaffold [options]", "scaffold wordpress theme"
        method_option "name",
          desc: "directory where project will be created"
        method_option "existing_project",
          aliases: "-e",
          type:    :boolean,
          default: true,
          desc:    "ignore existing files if an existing project"
        method_option "dry_run",
          aliases: "-n",
          type:    :boolean,
          default: false,
          desc:    "show what files would have been transfered"


        def scaffold
          destination_path = options[:name]
          rsync_files destination_path
        end

        private

          def scaffold_dir
            File.join File.expand_path( '../../../', __FILE__ ),
                      'scaffold'
          end

          def rsync_files destination_path
            flags = ["-av"]
            flags << "--dry-run" if options[:dry_run]
            flags << "--ignore-existing" if options[:existing_project]

            destination = destination_path.sub(/\/$/, '')
            system "mkdir -p #{destination}" unless options[:dry_run]
            system "rsync #{flags.join(' ')} #{scaffold_dir}/ #{destination}/"
          end

      end

    end
  end
end