$templatesObject = Get-Content -Raw -Path './templates/templates.json' | ConvertFrom-Json

foreach ($template in $templatesObject.templates) {
    Write-Host $template.name
    az bicep build --file "./templates/bicep/$($template.name).bicep"
}