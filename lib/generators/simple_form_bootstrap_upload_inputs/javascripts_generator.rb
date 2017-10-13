require 'rails/generators'

module SimpleFormBootstrapUploadInputs
  module Generators
    class JavascriptsGenerator < ::Rails::Generators::Base

      desc <<-DOC
        simple_form_bootstrap_upload_inputs.coffee
      DOC

      def self.source_root
        File.expand_path(File.join(File.dirname(__FILE__), '../../../app/assets/javascripts'))
      end

      def initialize(*args, &block)
        super
        generate_javascripts
      end

      private

      def generate_javascripts
        template "simple_form_bootstrap_upload_inputs.coffee", "app/assets/javascripts/simple_form_bootstrap_upload_inputs.coffee"
      end
    end
  end
end
