# frozen_string_literal: true

require File.expand_path('../../lib/otel/version', __dir__)
require 'mini_portile2'
require 'etc'
require 'mkmf'
require 'pkg-config'
require 'native-package-installer'

def create_compile_flags_txt
  cppflags = $CPPFLAGS.split
  include_flags = cppflags.select { |flag| flag.start_with?('-I') }
  define_flags = cppflags.select { |flag| flag.start_with?('-D') } + $defs

  File.open('compile_flags.txt', 'w') do |f|
    include_flags.each { |flag| f.puts(flag) }
    f.puts("-I#{Dir.pwd}")
    f.puts("-I#{RbConfig::CONFIG['rubyhdrdir']}")
    f.puts("-I#{RbConfig::CONFIG['rubyhdrdir']}/ruby/backward")
    f.puts("-I#{RbConfig::CONFIG['rubyarchhdrdir']}")
    define_flags.each { |flag| f.puts(flag) }
  end
end

def install_native_library(name, packages_on_destribution)
  unless PKGConfig.have_package(name)
    unless NativePackageInstaller.install(packages_on_destribution)
      exit(false)
    end
  end
end

class OpenTelemetryRecipe < MiniPortileCMake
  def configure_defaults
    configs = super
    configs << "-DCMAKE_POSITION_INDEPENDENT_CODE=TRUE"
    configs << "-DBUILD_TESTING=OFF"
    configs << "-DBUILD_SHARED_LIBS=ON"
    # TODO: gRPC can't be built on Ubuntu 22.04
    # configs << "-DWITH_OTLP_GRPC=ON"
    configs << "-DWITH_OTLP_HTTP=ON"
  end
end

install_native_library('libcurl', debian: 'libcurl4-openssl-dev', arch_linux: 'libcurl-gnutls')
install_native_library('absl_config', debian: 'libabsl-dev', arch_linux: 'abseil-cpp')
install_native_library('libcares', debian: 'libc-ares-dev', arch_linux: 'c-ares')
install_native_library('nlohmann_json', debian: 'nlohmann-json3-dev', arch_linux: 'nlohmann-json')
install_native_library('grpc++', debian: 'libgrpc++-dev', arch_linux: 'grpc++')
install_native_library('protobuf', debian: 'protobuf-compiler-grpc', arch_linux: 'protobuf')
install_native_library('zlib', debian: 'zlib1g-dev', arch_linux: 'zlib')

recipe = OpenTelemetryRecipe.new('otel-cpp', Otel::OPEN_TELEMETRY_CPP_VERSION, make_command: "make -j #{Etc.nprocessors}")
recipe.files << {
  url: "https://github.com/open-telemetry/opentelemetry-cpp/archive/v#{Otel::OPEN_TELEMETRY_CPP_VERSION}.tar.gz"
}
recipe.cook

libs = Dir.glob("#{recipe.path}/lib/*.so").map { |file| File.basename(file, '.so').delete_prefix('lib') }

$CPPFLAGS += " -std=c++11 -I#{recipe.path}/include"
$LDFLAGS += " -L#{recipe.path}/lib -Wl,-rpath,#{recipe.path}/lib #{libs.map { |lib| "-l#{lib}" }.join(' ')}"

create_makefile('otel')
create_compile_flags_txt
