#Billing metric data is stored in the US East (N. Virginia) Region and represents worldwide charges.
# Configure the AWS Provider

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

