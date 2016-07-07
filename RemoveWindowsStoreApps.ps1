$appsarray = "WindowsFeedback", "ContactSupport", "windowscommunicationsapps", "WindowsCamera", "XboxApp", "OneNote", "ZuneMusic", "ZuneVideo", "WindowsMaps", "WindowsSoundRecorder", "People", "CommsPhone", "WindowsAlarms"


$title = "Remove Windows Store Apps"
$message = "This will uninstall all the Windows Store apps in your PC."

$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
    "Removes all the uninstallable apps"

$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
    "No changes are made."

$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)

$result = $host.ui.PromptForChoice($title, $message, $options, 0) 




switch ($result)
{
    0{
        foreach($app in $appsarray) 
        {
            echo $app
            Get-AppxPackage -allusers *$app* | Remove-AppxPackage
        }
        }
    1 {
        echo "You selected No."
       }
    default {
        exit
        }
}

#Get-AppxPackage -allusers *WindowsFeedback* | Remove-AppxPackage
#Get-AppxPackage -allusers *WindowsFeedback* | Remove-AppxPackage
