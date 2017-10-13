require 'rails/generators'

module SimpleFormBootstrapUploadInputs
  module Generators
    class StylesheetsGenerator < ::Rails::Generators::Base

      desc <<-DOC
        simple_form_bootstrap_upload_inputs.scss
      DOC

      def self.source_root
        File.expand_path(File.join(File.dirname(__FILE__), '../../../app/assets/stylesheets'))
      end

      def initialize(*args, &block)
        super
        generate_stylesheets
      end

      private

      def generate_stylesheets
        template "simple_form_bootstrap_upload_inputs.scss", "app/assets/stylesheets/simple_form_bootstrap_upload_inputs.scss"
      end
    end
  end
end