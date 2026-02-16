// argo/infra/prometheus/crds-2.jsonnet
local cb = import 'crds-base.libsonnet';

{
  [c.k8s_name]: c.obj
  for c in cb.all_crds
  if !(std.startsWith(c.k8s_name, 'prometheus') || std.startsWith(c.k8s_name, 'alertmanager'))
}
