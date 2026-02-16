local base = import 'base.libsonnet';
local kp = base.kp;

{
  ['setup/prometheus-operator-' + name]: kp.prometheusOperator[name]
  for name in std.filter(
    function(name)
        name != 'serviceMonitor' &&
        name != 'prometheusRule' &&
        std.get(kp.prometheusOperator[name], 'kind') == 'CustomResourceDefinition',
    std.objectFields(kp.prometheusOperator))
}
