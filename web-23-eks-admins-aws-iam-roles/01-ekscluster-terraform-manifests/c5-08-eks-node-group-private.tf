#
# resource "aws_eks_node_group" "eks_ng_private" {
#   cluster_name    = aws_eks_cluster.eks_cluster.name
#   node_group_name = "${local.name}-eks-ng-private"
#   node_role_arn   = aws_iam_role.eks-node-group_role.arn
#
#   subnet_ids     = module.vpc.private_subnets
#   ami_type       = "AL2_x86_64"
#   capacity_type  = "ON_DEMAND"
#   disk_size      = 20
#   instance_types = ["t3.medium"]
#
#   remote_access {
#     ec2_ssh_key = "eks-terraform-key"
#   }
#
#   scaling_config {
#     desired_size = 1
#     max_size     = 2
#     min_size     = 1
#   }
#
#   update_config {
#     max_unavailable = 1
#   }
#
#   depends_on = [
#     aws_iam_role_policy_attachment.eks-node-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.eks-node-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.eks-node-AmazonEC2ContainerRegistryReadOnly,
#     kubernetes_config_map_v1.aws_auth
#   ]
#
#   tags = {
#     Name = "Private-Node-Group"
#   }
# }