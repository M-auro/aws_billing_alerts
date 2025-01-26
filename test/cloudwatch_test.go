package test

import (
    "fmt"
    "testing"

    "github.com/gruntwork-io/terratest/modules/terraform"
)

func TestCloudWatchAlarm(t *testing.T) {
    // Define the Terraform options
    terraformOptions := &terraform.Options{
        // The path to where your Terraform code is located
        TerraformDir: "../",

        // Variables to pass to our Terraform code using -var options
        Vars: map[string]interface{}{
            "alarm_name":     "TestBillingAlarm",
            "threshold":      100.0,
            "sns_topic_name": "test-sns-topic",
            "email":          "test-email@example.com",
            "create_kms_key": true,
        },
    }

    // Run `terraform init`
    terraform.Init(t, terraformOptions)

    // Capture the plan output
    planOutput, err := terraform.RunTerraformCommandAndGetStdoutE(t, terraformOptions, "plan", "-input=false", "-lock=false")
    if err != nil {
        t.Fatal(err)
    }

    // Print the plan output to the console
    fmt.Println("Terraform Plan Output:")
    fmt.Println(planOutput)
}
