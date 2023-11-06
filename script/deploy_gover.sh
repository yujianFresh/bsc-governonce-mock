#!/usr/bin/env bash

if [ -f .env ]; then
    export $(cat .env | xargs)
else
    echo "Please set your .env file"
    exit 1
fi

forge create ./src/contracts/MyToken.sol:MyToken -i --rpc-url ''${BSC_TEST_URL} --private-key ${TEST_PRIVATE_KEY} --etherscan-api-key ${BscScanApiKey} --verify
