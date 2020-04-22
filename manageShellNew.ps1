Function addShellNew{
    $item="."+$args[0]
    Set-ItemProperty -Path .\$item -Name "(default)" -Value VSCode$item
    New-Item -Path .\$item\ShellNew
    New-ItemProperty -Path .\$item\ShellNew -Name NullFile -PropertyType String
}
Function delShellNew{
    $item="."+$args[0]
    Remove-Item -Path .\$item\ShellNew -Recurse
}
Set-Location -Path Registry::HKEY_CLASSES_ROOT
$addList="c","cpp","js","json"
$delList="accdb","rtf","pub","bmp"
foreach ($item in $addList){
    addShellNew $item
}
foreach ($item in $delList){
    delShellNew $item
}