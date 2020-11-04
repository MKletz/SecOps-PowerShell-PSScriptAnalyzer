#!/bin/pwsh
param (
    [Parameter(Position=0)]
    [String]$Path
)

Process {
    Import-Module -Name 'PSScriptAnalyzer'

    # /github/workspace is the path to the mapped volume within the container where the checkout action will clone the repository too.
    $Path = Join-Path -Path '/github/workspace' -ChildPath $Path

    $SASplat = @{
        Path = $Path
        Recurse = $true
        
        # Include custom rules as well as the default ones
        CustomRulePath = '/custom_rules'
        RecurseCustomRulePath = $true
        IncludeDefaultRules = $true

        # Fail the action if a style violation is found
        EnableExit = $true
    }
    Invoke-ScriptAnalyzer @SASplat
}
