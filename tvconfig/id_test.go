package chainid

import (
	"fmt"
	"testing"
)

func TestCalcReward(t *testing.T) {
	r := CalcReward(15768000*2)
	fmt.Println(r)
}
