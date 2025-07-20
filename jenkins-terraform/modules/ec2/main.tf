resource "aws_instance" "jenkins_ec2" {
  count                = length(var.public_subnet_ids)
  instance_type        = var.instance_type_val
  ami                  = var.instance_type_val
  iam_instance_profile = var.instance_profile_name
  subnet_id            = var.public_subnet_ids[count.index]
  security_groups = [var.security_group_id]
  tags = {
    Name        = "${terraform.workspace}-policy-RT",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }

}
