output "lbc_helm_metadata" {
  description = "metadata block outlining status of the deployed release"

  value = helm_release.loadbalancer_controller.metadata
}