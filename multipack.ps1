$base = Get-Location
$client = "\turtledove-client-mod-pack"
$server = "\turtledove-server-mod-pack"
$directories = @( "$base$client", "$base$server" )

$refresh = "packwiz refresh"
$rebuild = "packwiz refresh --build"

foreach ($directory in $directories) {
    Invoke-Expression -Command "cd $directory"
    Invoke-Expression -Command $rebuild
}
Set-Location $base