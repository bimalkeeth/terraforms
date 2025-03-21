# EBS CSI Helm Release Outputs
output "ebs_csi_helm_metadata" {
  description = "Metadata Block outlining status of the deployed release."
  value = helm_release.abs_csi_drivers.metadata
}