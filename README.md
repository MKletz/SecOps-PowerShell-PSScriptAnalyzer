# SecOps PSScriptAnalyzer Action

Executes the team standard rules for PSScriptAnalyzer.

## Inputs

### `Path`

**Required** The path in the repository to target with `Invoke-ScriptAnalyzer`

## Example usage
```yaml
on: [push]

jobs:
  PSScriptAnalyzer_job:
    runs-on: ubuntu-latest
    name: PSScriptAnalyzer
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: PSScriptAnalyzer
      uses: techservicesillinois/SecOps-PowerShell-PSScriptAnalyzer@v1
      with:
        path: 'src'
```