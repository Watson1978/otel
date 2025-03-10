#include "otel.hpp"

#include "opentelemetry/exporters/otlp/otlp_http_metric_exporter_factory.h"
#include "opentelemetry/exporters/otlp/otlp_http_metric_exporter_options.h"
#include "opentelemetry/metrics/provider.h"

#include "opentelemetry/sdk/metrics/export/periodic_exporting_metric_reader_factory.h"
#include "opentelemetry/sdk/metrics/meter_context_factory.h"
#include "opentelemetry/sdk/metrics/meter_provider_factory.h"
#include "ruby/internal/special_consts.h"
#include "ruby/internal/value.h"

#define SCHEMA "https://opentelemetry.io/schemas/1.21.0"

namespace metric_sdk    = opentelemetry::sdk::metrics;
namespace metrics_api   = opentelemetry::metrics;
namespace otlp_exporter = opentelemetry::exporter::otlp;

VALUE mOtel;
VALUE cMetrics;
VALUE cCounter;

typedef struct
{
    opentelemetry::nostd::unique_ptr<metrics_api::Counter<double>> double_counter;
} MetricsCounter;

const rb_data_type_t metrics_counter_data_type = {
    "Otel::Metrics::Counter",
    {
        NULL,
        NULL,
        NULL,
    },
    0, 0,
    RUBY_TYPED_FREE_IMMEDIATELY | RUBY_TYPED_WB_PROTECTED | RUBY_TYPED_FROZEN_SHAREABLE,
};

static VALUE metrics_configure(VALUE self)
{
    otlp_exporter::OtlpHttpMetricExporterOptions exporter_options;
    auto exporter = otlp_exporter::OtlpHttpMetricExporterFactory::Create(std::move(exporter_options));

    std::string schema { SCHEMA };

    // Initialize and set the global MeterProvider
    metric_sdk::PeriodicExportingMetricReaderOptions reader_options;
    reader_options.export_interval_millis = std::chrono::milliseconds(1000);
    reader_options.export_timeout_millis  = std::chrono::milliseconds(500);

    auto reader = metric_sdk::PeriodicExportingMetricReaderFactory::Create(std::move(exporter), reader_options);

    auto context = metric_sdk::MeterContextFactory::Create();
    context->AddMetricReader(std::move(reader));

    auto u_provider = metric_sdk::MeterProviderFactory::Create(std::move(context));
    std::shared_ptr<opentelemetry::metrics::MeterProvider> provider(std::move(u_provider));

    metrics_api::Provider::SetMeterProvider(provider);

    return Qnil;
}

static VALUE metrics_create_counter(VALUE self)
{
    MetricsCounter *counter;
    VALUE counter_obj;

    counter_obj = TypedData_Make_Struct(cCounter, MetricsCounter, &metrics_counter_data_type, counter);

    std::string name{"otlp_grpc_metric_example"};
    std::string counter_name = name + "_counter";
    auto provider            = metrics_api::Provider::GetMeterProvider();
    opentelemetry::nostd::shared_ptr<metrics_api::Meter> meter = provider->GetMeter(name);
    counter->double_counter = meter->CreateDoubleCounter(counter_name);

    return counter_obj;
}

static VALUE counter_add(VALUE self, VALUE value)
{
    MetricsCounter *counter;
    double val = NUM2DBL(value);

    TypedData_Get_Struct(self, MetricsCounter, &metrics_counter_data_type, counter);
    counter->double_counter->Add(val);

    return self;
}

void CleanupMetrics()
{
    std::shared_ptr<metrics_api::MeterProvider> none;
    metrics_api::Provider::SetMeterProvider(none);
}

void Init_otel(void)
{
    mOtel = rb_define_module("Otel");
    cMetrics = rb_define_class_under(mOtel, "Metrics", rb_cObject);
    rb_define_method(cMetrics, "configure", RUBY_METHOD_FUNC(metrics_configure), 0);
    rb_define_method(cMetrics, "create_counter", RUBY_METHOD_FUNC(metrics_create_counter), 0);

    cCounter = rb_define_class_under(cMetrics, "Counter", rb_cObject);
    rb_define_method(cCounter, "add", RUBY_METHOD_FUNC(counter_add), 1);

    // TODO
    // CleanupMetrics();
}

