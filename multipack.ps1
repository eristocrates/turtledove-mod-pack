$div = '\'
$root = Get-Location
$base = "$root$div"
$client = "turtledove-client-mod-pack"
$server = "turtledove-server-mod-pack"

$modsBase = "mods.txt"
$clientBase = "client.txt"
$serverBase = "server.txt"

$last = "last"

$modsFile = "$base$modsBase"
$clientFile = "$base$clientBase"
$serverFile = "$base$serverBase"

$directories = @( 
    "$base$client",
    "$base$server"
)

$files = @( 
    "$base$modsFile",
    "$base$clientFile",
    "$base$serverFile"
)

$rebuild = "packwiz refresh --build"
$modrinth = "packwiz modrinth add"
$curseforge = "packwiz curseforge add"

# Check if the file exists
if (Get-Item -Path $modsFile) {
    # Read all lines from the file
    $urls = Get-Content $modsFile
    foreach ($directory in $directories) {
        Set-Location $directory
        foreach ($url in $urls) {
            # Trim any whitespace from the url path
            $url = $url.Trim()
            if ($url -like "*modrinth*") { 
                Invoke-Expression -Command "echo '$modrinth $url'" 
                Invoke-Expression -Command "$modrinth $url"
            }
            if ($url -like "*curseforge*") {
                Invoke-Expression -Command "echo '$curseforge $url'" 
                Invoke-Expression -Command "$curseforge $url"
            }
            Invoke-Expression -Command $rebuild
        }
    }
    Clear-Content -Path $modsFile
    Add-Content -Path "$modsFile.done" -Value $urls
    Set-Location $root
}
else {
    Write-Host "File not found: $files" -ForegroundColor Red
}

