This directory contains a [`terraform`](https://www.terraform.io/) stack that kickstarts an AWS instance with GPU (by default [g3s.xlarge](https://aws.amazon.com/ec2/instance-types/g3/)) and the [deep-learning AMI](https://aws.amazon.com/marketplace/pp/B07Y43P7X5?qid=1581968912318&sr=0-2&ref_=srh_res_product_title).

To use this, you need an AWS account and some credentials.

**Caution** The GPU machines are not part of the free tier; therefore, charges may apply.

__Note:__ All the content is in a single file for clarity

## Usage

### Init

To init the stack, you need to run:

`terraform init`

This creates a file called `tfstate` and downloads the scripts mandatory for terraform to interact with AWS

**Warning** do not remove the tfstate file, or you will not be able to destroy your machine without manual intervention.

### Configuration

3 variables are used in this stack:

- the ssh key name. For more info on the process, please see [Creating a key pair using amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair)
- the region where you want your instance
- the IP address allowed by the firewall (your IP - `curl ifconfig.co` is you friend)

You can enter those values at runtime, or create a file `terraform.tfvars` containing the following entries:

```text
region            = "us-east-1"
keyName           = "MyKeyName"
ssh_authorized_ip = "0.0.0.0/0" // Don't do that !
```

### Creating the machine

`terraform apply` creates a machine and display its IP address on stdout.
You can connect to the machine by `ssh` with the user `ubuntu` .

### Destroying the machine

`terraform destroy` destroys the machine. **All data are lost**. Billing is stopped.

### Finding the IP

`terraform output` is your friend. It will display the public IP of the machine.