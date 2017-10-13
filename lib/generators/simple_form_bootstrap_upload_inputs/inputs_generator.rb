require 'rails/generators'

module SimpleFormBootstrapUploadInputs
  module Generators
    class InputsGenerator < ::Rails::Generators::Base

      desc <<-DOC
        inputs/multiple_upload_input.rb
        inputs/single_upload_input.rb
      DOC

      def self.source_root
        File.expand_path(File.join(File.dirname(__FILE__), '../../../app/inputs'))
      end

      def initialize(*args, &block)
        super
        generate_javascripts
      end

      private

      def generate_javascripts
        template "multiple_upload_input.rb", "app/inputs/multiple_upload_input.rb"
        template "single_upload_input.rb", "app/inputs/single_upload_input.rb"
      end
    end
  end
end
