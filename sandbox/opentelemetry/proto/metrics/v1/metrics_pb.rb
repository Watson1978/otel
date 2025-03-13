# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: opentelemetry/proto/metrics/v1/metrics.proto

require 'google/protobuf'

require './opentelemetry/proto/common/v1/common_pb'
require './opentelemetry/proto/resource/v1/resource_pb'


descriptor_data = "\n,opentelemetry/proto/metrics/v1/metrics.proto\x12\x1eopentelemetry.proto.metrics.v1\x1a*opentelemetry/proto/common/v1/common.proto\x1a.opentelemetry/proto/resource/v1/resource.proto\"X\n\x0bMetricsData\x12I\n\x10resource_metrics\x18\x01 \x03(\x0b\x32/.opentelemetry.proto.metrics.v1.ResourceMetrics\"\xaf\x01\n\x0fResourceMetrics\x12;\n\x08resource\x18\x01 \x01(\x0b\x32).opentelemetry.proto.resource.v1.Resource\x12\x43\n\rscope_metrics\x18\x02 \x03(\x0b\x32,.opentelemetry.proto.metrics.v1.ScopeMetrics\x12\x12\n\nschema_url\x18\x03 \x01(\tJ\x06\x08\xe8\x07\x10\xe9\x07\"\x9f\x01\n\x0cScopeMetrics\x12\x42\n\x05scope\x18\x01 \x01(\x0b\x32\x33.opentelemetry.proto.common.v1.InstrumentationScope\x12\x37\n\x07metrics\x18\x02 \x03(\x0b\x32&.opentelemetry.proto.metrics.v1.Metric\x12\x12\n\nschema_url\x18\x03 \x01(\t\"\xcd\x03\n\x06Metric\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t\x12\x0c\n\x04unit\x18\x03 \x01(\t\x12\x36\n\x05gauge\x18\x05 \x01(\x0b\x32%.opentelemetry.proto.metrics.v1.GaugeH\x00\x12\x32\n\x03sum\x18\x07 \x01(\x0b\x32#.opentelemetry.proto.metrics.v1.SumH\x00\x12>\n\thistogram\x18\t \x01(\x0b\x32).opentelemetry.proto.metrics.v1.HistogramH\x00\x12U\n\x15\x65xponential_histogram\x18\n \x01(\x0b\x32\x34.opentelemetry.proto.metrics.v1.ExponentialHistogramH\x00\x12:\n\x07summary\x18\x0b \x01(\x0b\x32\'.opentelemetry.proto.metrics.v1.SummaryH\x00\x12\x39\n\x08metadata\x18\x0c \x03(\x0b\x32\'.opentelemetry.proto.common.v1.KeyValueB\x06\n\x04\x64\x61taJ\x04\x08\x04\x10\x05J\x04\x08\x06\x10\x07J\x04\x08\x08\x10\t\"M\n\x05Gauge\x12\x44\n\x0b\x64\x61ta_points\x18\x01 \x03(\x0b\x32/.opentelemetry.proto.metrics.v1.NumberDataPoint\"\xba\x01\n\x03Sum\x12\x44\n\x0b\x64\x61ta_points\x18\x01 \x03(\x0b\x32/.opentelemetry.proto.metrics.v1.NumberDataPoint\x12W\n\x17\x61ggregation_temporality\x18\x02 \x01(\x0e\x32\x36.opentelemetry.proto.metrics.v1.AggregationTemporality\x12\x14\n\x0cis_monotonic\x18\x03 \x01(\x08\"\xad\x01\n\tHistogram\x12G\n\x0b\x64\x61ta_points\x18\x01 \x03(\x0b\x32\x32.opentelemetry.proto.metrics.v1.HistogramDataPoint\x12W\n\x17\x61ggregation_temporality\x18\x02 \x01(\x0e\x32\x36.opentelemetry.proto.metrics.v1.AggregationTemporality\"\xc3\x01\n\x14\x45xponentialHistogram\x12R\n\x0b\x64\x61ta_points\x18\x01 \x03(\x0b\x32=.opentelemetry.proto.metrics.v1.ExponentialHistogramDataPoint\x12W\n\x17\x61ggregation_temporality\x18\x02 \x01(\x0e\x32\x36.opentelemetry.proto.metrics.v1.AggregationTemporality\"P\n\x07Summary\x12\x45\n\x0b\x64\x61ta_points\x18\x01 \x03(\x0b\x32\x30.opentelemetry.proto.metrics.v1.SummaryDataPoint\"\x86\x02\n\x0fNumberDataPoint\x12;\n\nattributes\x18\x07 \x03(\x0b\x32\'.opentelemetry.proto.common.v1.KeyValue\x12\x1c\n\x14start_time_unix_nano\x18\x02 \x01(\x06\x12\x16\n\x0etime_unix_nano\x18\x03 \x01(\x06\x12\x13\n\tas_double\x18\x04 \x01(\x01H\x00\x12\x10\n\x06\x61s_int\x18\x06 \x01(\x10H\x00\x12;\n\texemplars\x18\x05 \x03(\x0b\x32(.opentelemetry.proto.metrics.v1.Exemplar\x12\r\n\x05\x66lags\x18\x08 \x01(\rB\x07\n\x05valueJ\x04\x08\x01\x10\x02\"\xe6\x02\n\x12HistogramDataPoint\x12;\n\nattributes\x18\t \x03(\x0b\x32\'.opentelemetry.proto.common.v1.KeyValue\x12\x1c\n\x14start_time_unix_nano\x18\x02 \x01(\x06\x12\x16\n\x0etime_unix_nano\x18\x03 \x01(\x06\x12\r\n\x05\x63ount\x18\x04 \x01(\x06\x12\x10\n\x03sum\x18\x05 \x01(\x01H\x00\x88\x01\x01\x12\x15\n\rbucket_counts\x18\x06 \x03(\x06\x12\x17\n\x0f\x65xplicit_bounds\x18\x07 \x03(\x01\x12;\n\texemplars\x18\x08 \x03(\x0b\x32(.opentelemetry.proto.metrics.v1.Exemplar\x12\r\n\x05\x66lags\x18\n \x01(\r\x12\x10\n\x03min\x18\x0b \x01(\x01H\x01\x88\x01\x01\x12\x10\n\x03max\x18\x0c \x01(\x01H\x02\x88\x01\x01\x42\x06\n\x04_sumB\x06\n\x04_minB\x06\n\x04_maxJ\x04\x08\x01\x10\x02\"\xda\x04\n\x1d\x45xponentialHistogramDataPoint\x12;\n\nattributes\x18\x01 \x03(\x0b\x32\'.opentelemetry.proto.common.v1.KeyValue\x12\x1c\n\x14start_time_unix_nano\x18\x02 \x01(\x06\x12\x16\n\x0etime_unix_nano\x18\x03 \x01(\x06\x12\r\n\x05\x63ount\x18\x04 \x01(\x06\x12\x10\n\x03sum\x18\x05 \x01(\x01H\x00\x88\x01\x01\x12\r\n\x05scale\x18\x06 \x01(\x11\x12\x12\n\nzero_count\x18\x07 \x01(\x06\x12W\n\x08positive\x18\x08 \x01(\x0b\x32\x45.opentelemetry.proto.metrics.v1.ExponentialHistogramDataPoint.Buckets\x12W\n\x08negative\x18\t \x01(\x0b\x32\x45.opentelemetry.proto.metrics.v1.ExponentialHistogramDataPoint.Buckets\x12\r\n\x05\x66lags\x18\n \x01(\r\x12;\n\texemplars\x18\x0b \x03(\x0b\x32(.opentelemetry.proto.metrics.v1.Exemplar\x12\x10\n\x03min\x18\x0c \x01(\x01H\x01\x88\x01\x01\x12\x10\n\x03max\x18\r \x01(\x01H\x02\x88\x01\x01\x12\x16\n\x0ezero_threshold\x18\x0e \x01(\x01\x1a\x30\n\x07\x42uckets\x12\x0e\n\x06offset\x18\x01 \x01(\x11\x12\x15\n\rbucket_counts\x18\x02 \x03(\x04\x42\x06\n\x04_sumB\x06\n\x04_minB\x06\n\x04_max\"\xc5\x02\n\x10SummaryDataPoint\x12;\n\nattributes\x18\x07 \x03(\x0b\x32\'.opentelemetry.proto.common.v1.KeyValue\x12\x1c\n\x14start_time_unix_nano\x18\x02 \x01(\x06\x12\x16\n\x0etime_unix_nano\x18\x03 \x01(\x06\x12\r\n\x05\x63ount\x18\x04 \x01(\x06\x12\x0b\n\x03sum\x18\x05 \x01(\x01\x12Y\n\x0fquantile_values\x18\x06 \x03(\x0b\x32@.opentelemetry.proto.metrics.v1.SummaryDataPoint.ValueAtQuantile\x12\r\n\x05\x66lags\x18\x08 \x01(\r\x1a\x32\n\x0fValueAtQuantile\x12\x10\n\x08quantile\x18\x01 \x01(\x01\x12\r\n\x05value\x18\x02 \x01(\x01J\x04\x08\x01\x10\x02\"\xc1\x01\n\x08\x45xemplar\x12\x44\n\x13\x66iltered_attributes\x18\x07 \x03(\x0b\x32\'.opentelemetry.proto.common.v1.KeyValue\x12\x16\n\x0etime_unix_nano\x18\x02 \x01(\x06\x12\x13\n\tas_double\x18\x03 \x01(\x01H\x00\x12\x10\n\x06\x61s_int\x18\x06 \x01(\x10H\x00\x12\x0f\n\x07span_id\x18\x04 \x01(\x0c\x12\x10\n\x08trace_id\x18\x05 \x01(\x0c\x42\x07\n\x05valueJ\x04\x08\x01\x10\x02*\x8c\x01\n\x16\x41ggregationTemporality\x12\'\n#AGGREGATION_TEMPORALITY_UNSPECIFIED\x10\x00\x12!\n\x1d\x41GGREGATION_TEMPORALITY_DELTA\x10\x01\x12&\n\"AGGREGATION_TEMPORALITY_CUMULATIVE\x10\x02*^\n\x0e\x44\x61taPointFlags\x12\x1f\n\x1b\x44\x41TA_POINT_FLAGS_DO_NOT_USE\x10\x00\x12+\n\'DATA_POINT_FLAGS_NO_RECORDED_VALUE_MASK\x10\x01\x42\x7f\n!io.opentelemetry.proto.metrics.v1B\x0cMetricsProtoP\x01Z)go.opentelemetry.io/proto/otlp/metrics/v1\xaa\x02\x1eOpenTelemetry.Proto.Metrics.V1b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Opentelemetry
  module Proto
    module Metrics
      module V1
        MetricsData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.MetricsData").msgclass
        ResourceMetrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.ResourceMetrics").msgclass
        ScopeMetrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.ScopeMetrics").msgclass
        Metric = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.Metric").msgclass
        Gauge = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.Gauge").msgclass
        Sum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.Sum").msgclass
        Histogram = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.Histogram").msgclass
        ExponentialHistogram = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.ExponentialHistogram").msgclass
        Summary = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.Summary").msgclass
        NumberDataPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.NumberDataPoint").msgclass
        HistogramDataPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.HistogramDataPoint").msgclass
        ExponentialHistogramDataPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.ExponentialHistogramDataPoint").msgclass
        ExponentialHistogramDataPoint::Buckets = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.ExponentialHistogramDataPoint.Buckets").msgclass
        SummaryDataPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.SummaryDataPoint").msgclass
        SummaryDataPoint::ValueAtQuantile = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.SummaryDataPoint.ValueAtQuantile").msgclass
        Exemplar = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.Exemplar").msgclass
        AggregationTemporality = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.AggregationTemporality").enummodule
        DataPointFlags = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("opentelemetry.proto.metrics.v1.DataPointFlags").enummodule
      end
    end
  end
end
