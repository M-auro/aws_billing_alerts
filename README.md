# Billing Alerts Module

This module creates a CloudWatch alarm to monitor AWS billing and an SNS topic to send notifications.

## Usage

```hcl
module "billing_alerts" {
  source        = "./billing_alerts_module"
  alarm_name    = "MyBillingAlarm"
  threshold     = 100.0
  sns_topic_name = "my-sns-topic"
  email         = "my-email@example.com"
}

----------------------------------
-----------------------------------

# Billing Alerts Terraform Project

This project sets up AWS CloudWatch alarms and SNS notifications to monitor and alert on estimated charges for an AWS account.

## Files

- **main.tf**: Defines the main Terraform configuration, including the billing alerts module.
- **billing_module/**: Contains the Terraform module for setting up CloudWatch alarms and SNS notifications.
  - **main.tf**: Defines the resources for CloudWatch alarms and SNS notifications.
  - **variables.tf**: Defines the input variables for the module.
  - **outputs.tf**: Defines the output values for the module.
  - **versions.tf**: Specifies the required provider versions.
- **go.mod**: Go module file.
- **go.sum**: Go module dependencies.
- **LICENSE**: License file.
- **main_test.go**: Contains a simple Go test.
- **test/cloudwatch_test.go**: Contains tests for the CloudWatch alarm using Terratest.
- **.gitignore**: Git ignore file.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) >= 1.5.6
- [Go](https://golang.org/dl/) >= 1.21

## Usage

1. **Initialize the project:**

    ```sh
    terraform init
    ```

2. **Apply the Terraform configuration:**

    ```sh
    terraform apply
    ```

3. **Run tests:**

    ```sh
    go test ./...
    ```

## Variables

- `alarm_name`: The name of the CloudWatch alarm (default: "BillingAlarm").
- `threshold`: The threshold for the CloudWatch alarm (default: 75.0).
- `sns_topic_name`: The name of the SNS topic (default: "sns-topic-for-billing-alerts").
- `email`: The email address for SNS notifications (default: "your-email@example.com").

## Outputs

- **alarm_name**: The name of the CloudWatch alarm.

## License

This project is licensed under the terms of the Mozilla Public License Version 2.0.


