 module "alb" {
   source     = "./modules/alb"
   name= local.name
   subnets=  data.terraform_remote_state.vpc.outputs.public_subnet_ids
   is_internal= false
   vpc_id= data.terraform_remote_state.vpc.outputs.vpc_id
   
 }
 resource "aws_alb_target_group_attachment" "tgattachment" {
  depends_on = [
    module.alb
  ]
  count            = length(module.project_ec2.aws_instance.*.id) == 3 ? 3 : 0
  target_group_arn = module.alb.aws_alb_target_group
  target_id        = element(module.project_ec2.aws_instance.*.id, count.index)
  port             = 80
  
}