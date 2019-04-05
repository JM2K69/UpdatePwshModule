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
        $File = "./WUM.ps1"

    }
    process 
    {
        switch ($Scope) {
            'CurrentUser'
            {
            powershell.exe -File $File	    
            }
            'AllUsers'
            {
            Start-Process -FilePath powershell.exe -Verb RunAs -ArgumentList "$PSScriptRoot\$File" 
            }
            Default {}
        }
    }
    
    end {}
}