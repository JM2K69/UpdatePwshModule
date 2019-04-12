function Start-UpdatePwshModule {
    [CmdletBinding()]
    Param
    (
        # Description d’aide Freenas
        [Parameter(Mandatory = $true)]
        [ValidateSet("CurrentUser", "AllUsers")] 
        $Scope
    )
    begin 
    {
        $Script:pathPanel= $PSScriptRoot

    }
    process 
    {
        switch ($Scope) {
            'CurrentUser'
            {
            powershell.exe -File "$PSScriptRoot\WUM.ps1" 	    
            }
            'AllUsers'
            {
            Start-Process -FilePath powershell.exe -Verb RunAs -ArgumentList "$PSScriptRoot\WUM.ps1" 
            }
            Default {}
        }
    }
    
    end {}
}