# To load the variables in the .env file
source .env

# To deploy and verify our contract
forge script script/DeployTokenAndGover.s.sol:DeployTokenAndGover --rpc-url ''${BSC_TEST_URL} --broadcast --etherscan-api-key ${BscScanApiKey} --verify -vvvv
