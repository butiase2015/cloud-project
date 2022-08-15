provider "aws" {
  region = "us-east-2"
}

module "asg1" {
    source = "../module/ASG"
    launch_configuration =
    min_instance =
    max_instance =
    load_balancers =[]
    health_check_type=
    tag_propagate_at_launch= true
    tag_key=

    
}

module "launch_template" {
    source = "../module/EC2_TEMPLATE"
    image_id =
    security_groups =
    user_data=<<-EOF





                EOF
    
    destroy=true
}

module "elb1" {
    source = "../module/ELB"
    elb_name =
    security_groups =
    server_port =
    health_check_interval =
    health_check_timeout =
    healthy_threshold =
    unhealthy_threshold =
    elb_port =
    lb_protocol =
    instance_protocol =

    
    
}

module "sgroupelb" {
    source = "../module/SGROUP"
    src_port =
    dst_port =
    protocol =
    ingress_cidr_blocks =
    security_group_name =
    
}

module "sgroupec2" {
    source = "../module/SGROUP"
    src_port =
    dst_port =
    protocol =
    ingress_cidr_blocks =
    security_group_name =
    
    
    
}