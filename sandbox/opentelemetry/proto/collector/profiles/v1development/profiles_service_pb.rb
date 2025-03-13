# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: opentelemetry/proto/collector/profiles/v1development/profiles_service.proto

require 'google/protobuf'

require './opentelemetry/proto/profiles/v1development/profiles_pb'


descriptor_data = "\nKopentelemetry/proto/collector/profiles/v1development/profiles_service.proto\x12\x34opentelemetry.proto.collector.profiles.v1development\x1a\x39opentelemetry/proto/profiles/v1development/profiles.proto\"w\n\x1c\x45xportProfilesServiceRequest\x12W\n\x11resource_profiles\x18\x01 \x03(\x0b\x32<.opentelemetry.proto.profiles.v1development.ResourceProfiles\"\x8c\x01\n\x1d\x45xportProfilesServiceResponse\x12k\n\x0fpartial_success\x18\x01 \x01(\x0b\x32R.opentelemetry.proto.collector.profiles.v1development.ExportProfilesPartialSuccess\"P\n\x1c\x45xportProfilesPartialSuccess\x12\x19\n\x11rejected_profiles\x18\x01 \x01(\x03\x12\x15\n\rerror_message\x18\x02 \x01(\t2\xc7\x01\n\x0fProfilesService\x12\xb3\x01\n\x06\x45xport\x12R.opentelemetry.proto.collector.profiles.v1development.ExportProfilesServiceRequest\x1aS.opentelemetry.proto.collector.profiles.v1development.ExportProfilesServiceResponse\"\x00\x42\xc9\x01\n7io.opentelemetry.proto.collector.profiles.v1developmentB\x14ProfilesServiceProtoP\x01Z?go.opentelemetry.io/proto/otlp/collector/profiles/v1development\xaa\x02\x34OpenTelemetry.Proto.Collector.Profiles.V1Developmentb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Opentelemetry
  module Proto
    module Collector
      module Profiles
        module V1development
          ExportProfilesServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.collector.profiles.v1development.ExportProfilesServiceRequest").msgclass
          ExportProfilesServiceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.collector.profiles.v1development.ExportProfilesServiceResponse").msgclass
          ExportProfilesPartialSuccess = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.collector.profiles.v1development.ExportProfilesPartialSuccess").msgclass
        end
      end
    end
  end
end
