# turtledove-mod-pack

a packwiz modpack for my private use. I usually make more organized repos than this i promise

## lazy instructions

open github page
add [packwiz installer bootstrap](https://packwiz.infra.link/tutorials/installing/packwiz-installer/) to instance folder
add pre-launch command to instance setting
java -jar packwiz-installer-bootstrap.jar -g -s server <https://eristocrates.github.io/turtledove-mod-pack/pack.toml>
optionally add packwiz to environment variables

strat to [add mods](https://packwiz.infra.link/tutorials/creating/adding-mods/) from prism launcher export to packwiz adds

sort by provider
handle unknowns
for each provider, select mods by that provider and export from prism with custom template
.\packwiz.exe modrinth add {url} --version-filename "{filename}"
.\packwiz.exe curseforge add {url} --addon-id {url}
regex the addon-id from the end of the urls so the --addon-id works
run the add commands
try to run the game
see if curseforge api complains
packwiz remove or manually delete those files
packwiz refresh
try not to forget to keep track of those mods
git commit and push
????
profit
