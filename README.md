# iac-with-terraform

## Prerequisites
1. AWS account [how to set it up](https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180)
2. AWS user with an access key and permission to create resources in EC2 [how to set it up](https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180)
2. Installed aws-cli [how to install](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)
3. Configured aws credentials [aws configure](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

## Quick start with Terraform

**Note**: This example deploys resources into your AWS account. 
They should fall under the [AWS Free Tier](https://aws.amazon.com/free/) but beware ;)

**Note**: based on [An Introduction to Terraform](https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180)

1. Install [Terraform](https://www.terraform.io/). (If you're using brew try: `brew install terraform`)
2. `cd` into terraform-demo folder.
3. Create a vars.tf file based on vars.tf.example
4. Run `terraform plan`.
5. If the plan looks ok, run `terraform apply`.


## Deploy hello world flask app with ansible

**Note**: Based on https://github.com/tuppa/flask
1. `pip install ansible`
2. `cd` into ansible folder.
3. Create an inventory file called demo based on demo.example
3. Execute `ANSIBLE_SSH_PIPELINING=1 ansible-playbook -i demo demo.yml`


ALL DONE! :) now you can open {public_ip from terraform output} in your browser and get a hello from your aws flask app running on your aws instance

![alt tag](http://www.madewithhappy.com/wp-content/uploads/happy-dog2.jpg)
