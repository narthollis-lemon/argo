// argo/infra/prometheus/crds-base.libsonnet
local base = import 'base.libsonnet';
local kp = base.kp;

{
  all_crds: [
    { 
      // We grab the actual k8s name like 'prometheuses.monitoring.coreos.com'
      k8s_name: kp.prometheusOperator[n].metadata.name, 
      obj: kp.prometheusOperator[n] 
    }
    for n in std.objectFields(kp.prometheusOperator)
    if std.get(kp.prometheusOperator[n], 'kind') == 'CustomResourceDefinition'
  ]
}
