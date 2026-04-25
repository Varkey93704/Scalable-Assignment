param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("blue", "green")]
    [string]$Color
)

Write-Host "Switching service traffic to: $Color"
kubectl patch service scalable-assignment-bluegreen-service -p "{`"spec`":{`"selector`":{`"app`":`"scalable-assignment`",`"track`":`"$Color`"}}}"

Write-Host "Current service selector:"
kubectl get service scalable-assignment-bluegreen-service -o jsonpath="{.spec.selector}"

Write-Host ""
Write-Host "Current pods:"
kubectl get pods -l app=scalable-assignment
