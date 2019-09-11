### Gaia mainnet node
This manual for introduction to cosmos.network node.

Don't use this manual for production. 


#### Required
 - Docker engine: 18.09

#### Mainnet
```
git clone git@github.com:dlarchikov/gaia-mainnet-node.git
cd gaia-mainnet-node.git
docker build -t gaianode .
docker run -d --name=nodemainnet -v $PWD/.gaiad:/root/.gaiad gaianode
```

### Logs

Extract container ID.
```
docker ps -a | grep gaianode | awk '{print $1}'
```
Example result
```
ce242304e2d0
```

Attach to container
```
docker logs -f --tail <your container id>
```

#### Also
I made same tools for public testnet https://github.com/dlarchikov/gaia-testnet-node
