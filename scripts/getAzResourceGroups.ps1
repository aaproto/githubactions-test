$templatesObject = Get-Content -Raw -Path './templates/templates.json' | ConvertFrom-Json

foreach ($template in $templatesObject.templates) {
    Write-Host $template.name
    Write-Host $template.resourceGroupName
    New-AzResourceGroupDeployment -ResourceGroupName "$($template.resourceGroupName)" -TemplateFile "./templates/bicep/$($template.name).bicep"
}