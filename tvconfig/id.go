package chainid

import "math/big"

const ChainID = 399

const GasLimit = 1000000000000

const EnforceTips = true

const Period = 2
const Epoch = 30000

const YearBlocks = 15768000

const StartTime = 1756175709

const Reward = 200e18

const CoinBase = "0x0000000000000000000000000000000000111111"

const FeesCoinBase = "0x0000000000000000000000000000000000111111"

func CalcReward(number uint64) *big.Int {
	//year := number / YearBlocks
	//
	//blockReward := uint64(Reward)
	//for i := uint64(0); i < year; i++ {
	//	blockReward = blockReward * 9 / 10
	//}
	return new(big.Int).SetUint64(0)
}

const Addr1 = "0x0d87D0f77e1eA0B3F6FBe7c65C327c56f64257F7"
var Pri1 = "6056276d593e6123363563c8bacb12ec759b9d83e23edd888af4871cf0c03f3e"

const Addr2 = "0x1B5219B74a5D46CBdc834FB1EBBC2CE5982db36e"
var Pri2 = "165d3a03e63f6cc5324f75f0b8e70150ce55b91e49133f10bf9c756544323e6e"
