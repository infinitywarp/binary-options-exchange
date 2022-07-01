// SPDX-License-Identifier: None
pragma solidity =0.8.8;

contract Odds {
    uint16 private constant BASE = 10000;

    function fractionToDecimal(uint16 num, uint16 denom) public pure returns (uint16) {
        return ((num + denom) * BASE) / denom;
    }

    function decimalToFraction(uint16 dec) public pure returns (uint16 num, uint16 denom) {
        uint16 min;
        uint16 hcf;
        if ((dec - BASE) <= BASE) {
            min = dec - BASE;
        } else {
            min = BASE;
        }
        for (uint16 i = 1; i <= min; i++) {
            if ((dec - BASE) % i == 0 && BASE % i == 0) {
                hcf = i;
            }
        }
        return ((dec - BASE) / hcf, BASE / hcf);
    }
}
