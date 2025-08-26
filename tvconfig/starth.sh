nohup ./geth --identity sv --datadir=./data --syncmode 'full' --port 30303  --http --http.api 'web3,eth,net,debug,personal' --http.port 8545 --authrpc.port 8551 --gcmode archive --snapshot  >miner1.log 2>&1 &
nohup ./geth --identity sv --datadir=./data --syncmode 'full' --port 30304 --http --http.api 'web3,eth,net,debug,personal' --http.port 8546 --authrpc.port 8552 --gcmode archive --snapshot  >miner2.log 2>&1 &

nohup ./geth --identity tengo --datadir=./node1 --syncmode 'full' --port 30303  --http --http.api 'web3,eth,net,debug,personal' --http.port 8545 --allow-insecure-unlock --gcmode archive --snapshot  >miner1.log 2>&1 &
nohup ./geth --identity tengo --datadir=./node1 --syncmode 'full' --verbosity 5 --port 30303  --http --http.api 'web3,eth,net,debug,personal' --http.port 8545 --allow-insecure-unlock --gcmode archive --snapshot  >miner1.log 2>&1 &

nohup ./geth --identity tengo --datadir=./node2 --syncmode 'full' --port 30304 --http  --http.api 'web3,eth,net,debug,personal' --http.port 8547 --allow-insecure-unlock --gcmode archive --snapshot  >miner2.log 2>&1 &


nohup ./geth --identity lora --datadir=./data --syncmode 'full' --port 30305 --http --http.addr=0.0.0.0 --http --http.corsdomain '*' --http.vhosts '*' --http.api 'web3,eth,net,debug,trace,txpool' --http.port 8548 --ws --ws.addr '0.0.0.0' --ws.port 8549 --ws.api 'web3,eth,net,debug,trace'  --ws.origins '*' --allow-insecure-unlock --gcmode archive --snapshot  --authrpc.port 8553 >rpc.log 2>&1 &


nohup ./geth --identity sv --datadir=./data --syncmode 'full' --port 30304 --http --http.api 'web3,eth,net,debug,personal' --http.port 8546 --authrpc.port 8553 --gcmode archive --snapshot  >miner2.log 2>&1 &


nohup ./geth --identity sv --datadir=./data --syncmode 'full' --port 30303  --gcmode archive --snapshot >miner1.log 2>&1 &


nohup ./geth --identity sv --datadir=./data/node1 --syncmode 'full' --port 30303  --http --http.addr=0.0.0.0 --http --http.corsdomain '*' --http.vhosts '*' --http.api 'web3,eth,net,debug,personal' --http.port 8545 --authrpc.port 8551 --ws --ws.addr '0.0.0.0' --ws.port 8549 --ws.api 'web3,eth,net,debug,trace'  --ws.origins '*' --gcmode archive --snapshot  >miner1.log 2>&1 &

nohup ./geth --identity sv --datadir=./data/node2 --syncmode 'full' --port 30304 --http --http.api 'web3,eth,net,debug,personal' --http.port 8546 --authrpc.port 8552 --gcmode archive --snapshot  >miner2.log 2>&1 &












nohup ./geth --identity tengo --datadir=./node1 --syncmode 'full' --port 30303  --http --http.addr=0.0.0.0 --http.corsdomain '*' --http.vhosts '*'  --http.api 'web3,eth,net,debug' --http.port 8545 --gcmode archive --snapshot  >miner1.log 2>&1 &

nohup ./geth --identity tengo --datadir=./node2 --syncmode 'full' --port 30304 --http --http.addr=0.0.0.0 --http.api 'web3,eth,net,debug' --http.port 8547 --gcmode archive --snapshot --authrpc.port 8552 >miner2.log 2>&1 &


nohup ./geth --identity tengo --datadir=./node2 --syncmode 'full' --port 30305 --http --http.addr=0.0.0.0 --http --http.corsdomain '*' --http.vhosts '*' --http.api 'web3,eth,net,debug,trace,txpool' --http.port 8548 --ws --ws.addr '0.0.0.0' --ws.port 8550 --ws.api 'web3,eth,net,debug,trace'  --ws.origins '*' --allow-insecure-unlock --gcmode archive --snapshot --authrpc.port 8552  >miner2.log 2>&1 &
nohup ./geth --identity tengo --datadir=./node1 --syncmode 'full' --port 30306 --http --http.addr=0.0.0.0 --http --http.corsdomain '*' --http.vhosts '*' --http.api 'web3,eth,net,debug,trace,txpool' --http.port 8549 --ws --ws.addr '0.0.0.0' --ws.port 8551 --ws.api 'web3,eth,net,debug,trace'  --ws.origins '*' --allow-insecure-unlock --gcmode archive --snapshot --authrpc.port 8553  >miner1.log 2>&1 &



# personal.unlockAccount(personal.listAccounts[0],"123456",0)
# miner.setEtherbase(personal.listAccounts[0])
# miner.start(1)


./geth --datadir=./node1 init genesis.json

./geth --datadir=./data account new
./geth --datadir=./data init allocSingers.json
nohup ./geth --identity sv --datadir=./data --syncmode 'full' --port 30303  --gcmode archive --snapshot  >miner.log 2>&1 &



./geth --datadir=./data account new
./geth --datadir=./data init allocSingers.json
nohup ./geth --identity sv --datadir=./data --syncmode 'full' --port 30304  --gcmode archive --snapshot  >miner.log 2>&1 &

./geth --datadir=./data account new
./geth --datadir=./data init allocSingers.json
nohup ./geth --identity sv --datadir=./data --syncmode 'full' --port 30305  --gcmode archive --snapshot  >miner.log 2>&1 &