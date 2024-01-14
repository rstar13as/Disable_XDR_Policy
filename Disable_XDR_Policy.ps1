# Carbon Black Cloud API Endpoint for policies $apiUrl = "https://defense-prod05.conferdeploy.net"
# Your API credentials
$apiKey = " " 
$orgKey = " "
# Define the headers with API key and content type $headers = @{
"X-Auth-Token" = $apiKey
"Content-Type" = "application/json" }
# Get all policies
$response = Invoke-RestMethod $apiUrl"/policyservice/v1/orgs/"$orgKey"/policies/summary" -Headers $headers -Method Get
# Loop through each policy and update the specific field foreach ($policy in $response.policies) {
$policyId = $policy.id $json =@"
[ {
} ]
"@
# Update the policy using PUT method
Invoke-RestMethod $apiUrl"/policyservice/v1/orgs/"$orgKey"/policies/"$policyId"/rule_configs/data_collection" -Headers $headers -Method PUT -Body $json
}
Write-Output "All policies have been updated with the new value: false for the field: enable_network_data_collection"
