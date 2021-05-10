pragma solidity >=0.5.0 <0.6.0;

import "./ZombieFeeding.sol";

contract ZombieHelper is ZombieFeeding {
    modifier aboveLevel(uint256 _level, uint256 _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }

    function changeName(uint256 _zombieId, string calldata _newName)
        external
        aboveLevel(2, _zombieId)
    {
        require(msg.sender = zombieToOwner[_zombieId]);
        Zombies[_zombieId].name = _newName;
    }

    function changeName(uint256 _zombieId, uint256 _newDna)
        external
        aboveLevel(20, _zombieId)
    {
        require(msg.sender = zombieToOwner[_zombieId]);
        Zombies[_zombieId].dna = _newDna;
    }

    function getZombieByOwner(address _address)
        external
        view
        returns (uint256[] memory)
    {
        uint[] memory result = new uint[](ownerZombieCount[_owner])
        uint counter = 0;
        for (uint i = 0; i < zombies.length, i++) {
            if(zombieTOoOwner[i] == _owner) {
                counter++;
            }
        }
        return result;

    }
}
