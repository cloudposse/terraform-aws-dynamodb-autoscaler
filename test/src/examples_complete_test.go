package test

import (
	"github.com/stretchr/testify/assert"
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	randId := strconv.Itoa(rand.Intn(100000))
	attributes := []string{randId}

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
		Vars: map[string]interface{}{
			"attributes": attributes,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	tableName := terraform.Output(t, terraformOptions, "table_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-test-dynamodb-autoscaler-"+randId, tableName)

	// Run `terraform output` to get the value of an output variable
	tableArn := terraform.Output(t, terraformOptions, "table_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, tableArn, "table/eg-test-dynamodb-autoscaler-"+randId)

	// Run `terraform output` to get the value of an output variable
	appautoscalingReadTargetId := terraform.Output(t, terraformOptions, "appautoscaling_read_target_id")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "table/eg-test-dynamodb-autoscaler-"+randId, appautoscalingReadTargetId)

	// Run `terraform output` to get the value of an output variable
	appautoscalingWriteTargetId := terraform.Output(t, terraformOptions, "appautoscaling_write_target_id")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "table/eg-test-dynamodb-autoscaler-"+randId, appautoscalingWriteTargetId)
}
