# Billing Alerts Terraform Project

This project sets up AWS CloudWatch alarms and SNS notifications to monitor and alert on estimated charges for an AWS account.

## Usage

## Files

- **cloudwatch.tf**: Defines the CloudWatch metric alarm for monitoring estimated charges.
- **sns.tf**: Creates an SNS topic and subscription for sending email notifications.
- **provider.tf**: Configures the AWS provider.
- **outputs.tf**: Outputs the name of the CloudWatch alarm.
- **versions.tf**: Specifies the required provider versions.
- **main_test.go**: Contains a simple Go test.
- **test/cloudwatch_test.go**: Contains tests for the CloudWatch alarm using Terratest.

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

## Outputs

- **alarm_name**: The name of the CloudWatch alarm.

## License

This project is licensed under the terms of the Mozilla Public License Version 2.0.

