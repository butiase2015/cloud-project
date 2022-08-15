provider "aws" {
  region = "us-east-1"
}

module "asg1" {
  source                  = "../module/ASG"
  launch_configuration    = module.launch_template.id
  min_instance            = 2
  max_instance            = 4
  load_balancers          = [module.elb1.id]
  health_check_type       = "ELB"
  tag_propagate_at_launch = true
  tag_key                 = "Name"
  tag_value                 ="ASG-webserver"


}

module "launch_template" {
  source          = "../module/EC2_TEMPLATE"
  instance_type   = "t2.micro"
  image_id        = "ami-0b0ea68c435eb488d"
  security_groups = [module.sgroupec2.id]
  user_data       = <<-EOF

#!/bin/bash

sudo apt update -y && apt upgrade -y
sudo apt install -y  apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-cache policy docker-ce && sudo apt -y install docker-ce


sudo apt-get install -y docker-compose git docker-compose apache2


sudo docker pull jenkins/jenkins:lts
sudo docker run -d -p 8080:8080 jenkins/jenkins:lts


sudo systemctl enable apache2 && sudo systemctl restart apache2

                EOF


}

module "elb1" {
  source                = "../module/ELB"
  elb_name              = "webserver-elb"
  security_groups       = [module.sgroupelb.id]
  server_port           = 80
  health_check_interval = 30
  health_check_timeout  = 3
  healthy_threshold     = 2
  unhealthy_threshold   = 2
  elb_port              = 80
  instance_port         = 80
  lb_protocol           = "http"
  instance_protocol     = "http"



}

module "sgroupelb" {
  source              = "../module/SGROUP"
  src_port            = 80
  dst_port            = 80
  protocol            = "tcp"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  security_group_name = "elb-securitygroup"

}

module "sgroupec2" {
  source              = "../module/SGROUP"
  src_port            = 80
  dst_port            = 80
  protocol            = "tcp"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  security_group_name = "ec2-securitygroup"



}