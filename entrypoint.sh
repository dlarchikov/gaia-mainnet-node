#/bin/bash

if [ ! -d /root/.gaiad/config ]; then
	gaiad init `cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1` > /dev/null
	sed -i -e 's/persistent_peers = ""/persistent_peers = "3e16af0cead27979e1fc3dac57d03df3c7a77acc@3.87.179.235:26656,ba3bacc714817218562f743178228f23678b2873@public-seed-node.cosmoshub.certus.one:26656,2626942148fd39830cb7a3acccb235fab0332d86@173.212.199.36:26656,3028c6ee9be21f0d34be3e97a59b093e15ec0658@91.205.173.168:26656,89e4b72625c0a13d6f62e3cd9d40bfc444cbfa77@34.65.6.52:26656,6be0856f6365559fdc2e9e97a07d609f754632b0@cosmos-cosmoshub-2-seed.nodes.polychainlabs.com:26656"/g' /root/.gaiad/config/config.toml

	cat /root/.gaiad/config/config.toml
fi

curl https://raw.githubusercontent.com/cosmos/launch/master/genesis.json > /root/.gaiad/config/genesis.json

gaiad start