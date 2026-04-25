param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("blue", "green")]
    [string]$Color
)

$patch = @{
    spec = @{
        selector = @{
            app = "scalable-assignment"
            track = $Color
        }
    }
} | ConvertTo-Json -Compress

$patchFile = Join-Path $env:TEMP "bluegreen-service-patch.json"
$patch | Set-Content -Path $patchFile -Encoding ascii

Write-Host "Switching service traffic to: $Color"
kubectl patch service scalable-assignment-bluegreen-service --type merge --patch-file $patchFile

Write-Host "Current service selector:"
kubectl get service scalable-assignment-bluegreen-service -o jsonpath="{.spec.selector}"

Write-Host ""
Write-Host "Current pods:"
kubectl get pods -l app=scalable-assignment

Remove-Item $patchFile -ErrorAction SilentlyContinue
