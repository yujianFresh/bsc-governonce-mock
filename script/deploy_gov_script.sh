# To load the variables in the .env file
source .env

# To deploy and verify our contract
forge script script/tokenAndGover.s.sol:GoverScript --rpc-url ''${BSC_TEST_URL} --broadcast --etherscan-api-key ${BscScanApiKey} --verify -vvvv
