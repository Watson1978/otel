# frozen_string_literal: true
require 'sinatra'
require 'google/protobuf'
require './opentelemetry/proto/collector/metrics/v1/metrics_service_pb.rb'
require './opentelemetry/proto/metrics/v1/metrics_pb.rb'



post '/v1/metrics' do
  p "!" * 80
  data = request.body.read
  p data
  proto = Opentelemetry::Proto::Collector::Metrics::V1::ExportMetricsServiceRequest.decode(data)
  p proto
  p proto.to_json
  p Opentelemetry::Proto::Collector::Metrics::V1::ExportMetricsServiceRequest.decode_json(proto.to_json)
end
