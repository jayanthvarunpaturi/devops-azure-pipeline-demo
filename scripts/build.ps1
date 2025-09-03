param(
    [string]$ImageName = "azure-pipeline-demo:local"
)
docker build -t $ImageName .
Write-Host "Built image $ImageName"
