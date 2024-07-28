package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestACRDeployment(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
        // Set the path to the Terraform code that will be tested.
        TerraformDir: "../ACR/",
        VarFiles: []string{"terraform.tfvars"},
    }

    // Clean up resources with "terraform destroy" at the end of the test.
    defer terraform.Destroy(t, terraformOptions)

    // Deploy the infrastructure with "terraform apply".
    terraform.InitAndApply(t, terraformOptions)

    // Run assertions to validate the deployment.
    actualACRName := terraform.Output(t, terraformOptions, "name")
    expectedACRName := "testacrforaks1"
    assert.Equal(t, expectedACRName, actualACRName)

    // Add more assertions as needed to validate the deployment.
}
