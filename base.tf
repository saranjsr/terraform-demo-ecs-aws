
module "network" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"

  name               = "${var.name}"
  cidr               = "${var.cidr}"
  azs                = "${var.azs}"
  public_subnets     = "${var.public_subnets}"
  private_subnets    = "${var.private_subnets}"
  enable_nat_gateway = "${var.enable_nat_gateway}"
  single_nat_gateway = "${var.single_nat_gateway}"
}

resource "aws_security_group" "ec2_sg" {
  name        = "ecs-ec2 sg"
  description = "Allow all inbound traffic"
  vpc_id      = "${module.network.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ecs-ec2 sg"
  }

}

resource "aws_security_group" "alb_public_sg" {
  name        = "alb_public_sg"
  description = "Used for access to the public instances"
  vpc_id      = "${module.network.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "alb sg"
  }
}
