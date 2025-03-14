# frozen_string_literal: true

require_relative "lib/otel/version"

Gem::Specification.new do |spec|
  spec.name = "otel"
  spec.version = Otel::VERSION
  spec.authors = ["Shizuo Fujita"]
  spec.email = ["watson1978@gmail.com"]

  spec.summary = "The Ruby binding for OpenTelemetry C++ SDK"
  spec.description = "The Ruby binding for OpenTelemetry C++ SDK"
  spec.homepage = "https://github.com/Watson1978/otel"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Watson1978/otel"
  spec.metadata["changelog_uri"] = "https://github.com/Watson1978/otel/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.extensions << 'ext/otel/extconf.rb'

  spec.add_dependency('pkg-config', '~> 1.6')
  spec.add_dependency('native-package-installer', '~> 1.1')
  spec.add_dependency('mini_portile2', '~> 2.8')
end
