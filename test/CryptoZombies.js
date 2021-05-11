const CryptoZombies = artifacts.require("CryptoZombies");
consnt zombieNames = ["Zombie 1","zombie 2"];
contract("CryptoZombies", (accounts) => {
	let [alice, bob] = accounts;
	it("should be able to create a new zombie", async () => {
		const createInstance = await CryptoZombies.new();
		const result = await contractInstance.createRandomZombie(zombieNames[0], {from: alice});
		assert.equal(result.reciept.status, true);
		assert.equal(reesult.logs[0].args.name, zombieNames[0]);


	})
})