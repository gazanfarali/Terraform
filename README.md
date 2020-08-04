# Terraform-module
repo to host tf functions files




https://registry.terraform.io/providers/hashicorp/aws/latest/docs

https://www.terraform.io/docs/configuration/variables.html

https://learn.hashicorp.com/terraform/getting-started/variables

https://www.terraform.io/docs/configuration/providers.html

https://www.terraform.io/docs/modules/index.html



**************************************************

useful commands:

terraform fmt
terraform validate


import commands:

 terraform import aws_s3_bucket.foo cf-templates-x3i832raup6a-eu-west-2
 
 terraform state show cf-templates-x3i832raup6a-eu-west-2
 
 import as module commands:
 
PS C:\terraform-test-dir\import to modules> terraform import module.import-s3.aws_s3_bucket.foo import-as-module-test


PS C:\terraform-test-dir\import to modules> terraform init
Initializing modules...
- import-s3 in module

Initializing the backend...

Initializing provider plugins...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\terraform-test-dir\import to modules> terraform import module.import-s3.aws_s3_bucket.foo import-as-module-test
module.import-s3.aws_s3_bucket.foo: Importing from ID "import-as-module-test"...
module.import-s3.aws_s3_bucket.foo: Import prepared!
  Prepared aws_s3_bucket for import
module.import-s3.aws_s3_bucket.foo: Refreshing state... [id=import-as-module-test]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

*****************
taint command:

cd to dir where main in located (and you have sub directory as module with resources)

terraform init
terraform plan
terraform apply
terraform destroy

terraform taint module.test_s3_bis_bucket.aws_s3_bucket.foo


PS C:\terraform-test-dir\taint\module> cd ..
PS C:\terraform-test-dir\taint> terraform taint module.test_s3_bis_bucket.aws_s3_bucket.foo
Resource instance module.test_s3_bis_bucket.aws_s3_bucket.foo has been marked as tainted.
PS C:\terraform-test-dir\taint> terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

module.test_s3_bis_bucket.aws_s3_bucket.foo: Refreshing state... [id=import-as-module-test]
module.test_s3_bis_bucket.aws_s3_bucket.bar: Refreshing state... [id=import-as-module-test-22]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # module.test_s3_bis_bucket.aws_s3_bucket.foo is tainted, so must be replaced
-/+ resource "aws_s3_bucket" "foo" {
      + acceleration_status         = (known after apply)
        acl                         = "private"
      ~ arn                         = "arn:aws:s3:::import-as-module-test" -> (known after apply)
        bucket                      = "import-as-module-test"
      ~ bucket_domain_name          = "import-as-module-test.s3.amazonaws.com" -> (known after apply)
      ~ bucket_regional_domain_name = "import-as-module-test.s3.eu-west-2.amazonaws.com" -> (known after apply)
        force_destroy               = false
      ~ hosted_zone_id              = "Z3GKZC51ZF0DB4" -> (known after apply)
      ~ id                          = "import-as-module-test" -> (known after apply)
      ~ region                      = "eu-west-2" -> (known after apply)
      ~ request_payer               = "BucketOwner" -> (known after apply)
        tags                        = {
            "Environment" = "Dev"
            "Name"        = "My bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      ~ versioning {
          ~ enabled    = false -> (known after apply)
          ~ mfa_delete = false -> (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

PS C:\terraform-test-dir\taint> terraform untaint module.test_s3_bis_bucket.aws_s3_bucket.foo
Resource instance module.test_s3_bis_bucket.aws_s3_bucket.foo has been successfully untainted.
PS C:\terraform-test-dir\taint> terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

module.test_s3_bis_bucket.aws_s3_bucket.foo: Refreshing state... [id=import-as-module-test]
module.test_s3_bis_bucket.aws_s3_bucket.bar: Refreshing state... [id=import-as-module-test-22]

------------------------------------------------------------------------

No changes. Infrastructure is up-to-date.

This means that Terraform did not detect any differences between your
configuration and real physical resources that exist. As a result, no
actions need to be performed.
PS C:\terraform-test-dir\taint> terraform taint module.test_s3_bis_bucket.aws_s3_bucket.foo
Resource instance module.test_s3_bis_bucket.aws_s3_bucket.foo has been marked as tainted.
PS C:\terraform-test-dir\taint> terraform apply
module.test_s3_bis_bucket.aws_s3_bucket.foo: Refreshing state... [id=import-as-module-test]
module.test_s3_bis_bucket.aws_s3_bucket.bar: Refreshing state... [id=import-as-module-test-22]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # module.test_s3_bis_bucket.aws_s3_bucket.foo is tainted, so must be replaced
-/+ resource "aws_s3_bucket" "foo" {
      + acceleration_status         = (known after apply)
        acl                         = "private"
      ~ arn                         = "arn:aws:s3:::import-as-module-test" -> (known after apply)
        bucket                      = "import-as-module-test"
      ~ bucket_domain_name          = "import-as-module-test.s3.amazonaws.com" -> (known after apply)
      ~ bucket_regional_domain_name = "import-as-module-test.s3.eu-west-2.amazonaws.com" -> (known after apply)
        force_destroy               = false
      ~ hosted_zone_id              = "Z3GKZC51ZF0DB4" -> (known after apply)
      ~ id                          = "import-as-module-test" -> (known after apply)
      ~ region                      = "eu-west-2" -> (known after apply)
      ~ request_payer               = "BucketOwner" -> (known after apply)
        tags                        = {
            "Environment" = "Dev"
            "Name"        = "My bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      ~ versioning {
          ~ enabled    = false -> (known after apply)
          ~ mfa_delete = false -> (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.test_s3_bis_bucket.aws_s3_bucket.foo: Destroying... [id=import-as-module-test]
module.test_s3_bis_bucket.aws_s3_bucket.foo: Destruction complete after 0s
module.test_s3_bis_bucket.aws_s3_bucket.foo: Creating...
module.test_s3_bis_bucket.aws_s3_bucket.foo: Creation complete after 2s [id=import-as-module-test]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
PS C:\terraform-test-dir\taint>

Note: if not in module you have to simply use "terrafom tain {resource name (aws_s3_bucket.foo) }"
*********************************

Terraform remove and mv command:

terraform state mv (resource name) (new resource name)

terraform state rm (resource name)


