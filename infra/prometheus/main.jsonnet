local kp = (import 'kube-prometheus/main.libsonnet') + {
  values+:: {
    common+: {
      namespace: 'monitoring',
    },
  },
  // Use double colons to hide the field from the output completely
  prometheusAdapter:: null,
};

// Only output the keys we actually want
{
  [name + '-setup']: kp.kubePrometheus[name] for name in std.objectFields(kp.kubePrometheus)
} +
{
  [name + '-operator']: kp.prometheusOperator[name] for name in std.objectFields(kp.prometheusOperator)
} +
{
  [name + '-node-exporter']: kp.nodeExporter[name] for name in std.objectFields(kp.nodeExporter)
} +
{
  [name + '-kube-state-metrics']: kp.kubeStateMetrics[name] for name in std.objectFields(kp.kubeStateMetrics)
} +
{
  [name + '-alertmanager']: kp.alertmanager[name] for name in std.objectFields(kp.alertmanager)
} +
{
  [name + '-prometheus']: kp.prometheus[name] for name in std.objectFields(kp.prometheus)
} +
{
  [name + '-grafana']: kp.grafana[name] for name in std.objectFields(kp.grafana)
}
