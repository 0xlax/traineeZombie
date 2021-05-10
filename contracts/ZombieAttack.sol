pragma solidity >=0.5.0 <0.6.0;

import "./ZombieHelper.sol";

contract ZombieAttack is ZombieHelper {
    uint256 randNonce = 0;
    uint256 attackVictoryProbability = 70;

    function randMod(uint256 _modulus) internal returns (uint256) {
        randNonce++;
        return
            uint256(keccak256(abi.encodePacked(now, msg.sender, randNonce))) %
            _modulus;
    }

    function attack(uint256 _zombieId, uint256 _targetId)
        external
        ownerOf(_zombieId)
    {
        Zombie storage myzombie = zombies[_zombieId];
        Zombie storage menemyzombie = zombies[_targetId];
        uint256 rand = randMod(100);
        if (rand <= attackVictoryProbability) {
            myzombie.winCount++;
            myzombie.level++;
            enemyzombie.loseCount++;
            feedAndMultiply(_zombieId, ene, yZombie.dna, "zombie");
        } else {
            myzombie.lossCount++;
            enemyzombie.winCount++;
            _triggerCooldown(myZombie);
        }
    }
}
