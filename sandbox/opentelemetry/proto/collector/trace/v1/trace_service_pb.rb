# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: opentelemetry/proto/collector/trace/v1/trace_service.proto

require 'google/protobuf'

require './opentelemetry/proto/trace/v1/trace_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("opentelemetry/proto/collector/trace/v1/trace_service.proto", :syntax => :proto3) do
    add_message "opentelemetry.proto.collector.trace.v1.ExportTraceServiceRequest" do
      repeated :resource_spans, :message, 1, "opentelemetry.proto.trace.v1.ResourceSpans"
    end
    add_message "opentelemetry.proto.collector.trace.v1.ExportTraceServiceResponse" do
      optional :partial_success, :message, 1, "opentelemetry.proto.collector.trace.v1.ExportTracePartialSuccess"
    end
    add_message "opentelemetry.proto.collector.trace.v1.ExportTracePartialSuccess" do
      optional :rejected_spans, :int64, 1
      optional :error_message, :string, 2
    end
  end
end

module Opentelemetry
  module Proto
    module Collector
      module Trace
        module V1
          ExportTraceServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.collector.trace.v1.ExportTraceServiceRequest").msgclass
          ExportTraceServiceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.collector.trace.v1.ExportTraceServiceResponse").msgclass
          ExportTracePartialSuccess = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.collector.trace.v1.ExportTracePartialSuccess").msgclass
        end
      end
    end
  end
end
