# frozen_string_literal: true
require 'sinatra'
require 'google/protobuf'
require './opentelemetry/proto/metrics/v1/metrics_pb.rb'



post '/v1/metrics' do
  p "!" * 80
  data = request.body.read
  proto = Opentelemetry::Proto::Metrics::V1::MetricsData.decode(data)
  p proto
  p Opentelemetry::Proto::Metrics::V1::MetricsData.decode_json(proto.to_json)
end
