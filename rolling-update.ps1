param(
    [Parameter(Mandatory = $true)]
    [string]$Version
)

$image = "varkey93704/scalable-assignment:$Version"

Write-Host "Loading image into Minikube: $image"
minikube image load $image

Write-Host "Updating deployment image to: $image"
kubectl set image deployment/scalable-assignment flask-api=$image

Write-Host "Waiting for rollout to complete..."
kubectl rollout status deployment/scalable-assignment

Write-Host "Current pods:"
kubectl get pods -l app=scalable-assignment
