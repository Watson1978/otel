require 'otel'

ENV["OTEL_EXPORTER_OTLP_ENDPOINT"] = "http://127.0.0.1:4318"

metrics = Otel::Metrics.new
metrics.configure

counter = metrics.create_counter

10.times do |i|
  counter.add(i)
  sleep 1
end
