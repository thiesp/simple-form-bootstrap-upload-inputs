# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_form_bootstrap_upload_inputs/version'

Gem::Specification.new do |spec|
  spec.add_dependency "bootstrap"
  spec.add_dependency "simple_form"
  spec.add_dependency "cocoon"


  spec.name          = "simple_form_bootstrap_upload_inputs"
  spec.version       = SimpleFormBootstrapUploadInputs::VERSION
  spec.authors       = ["Thies Pierdola"]
  spec.email         = ["tp@centic.dk"]

  spec.summary       = %q{Simple form upload input for single and multiple file uploads.}
  spec.description   = %q{Simple form upload input for single and multiple file uploads.}
  spec.homepage      = "https://github.com/thiesp/simple-form-bootstrap-upload-inputs"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://dummy.dont.push"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
