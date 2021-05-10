pragma solidity >=0.5.0 <0.6.0;

import "./ZombieFeeding.sol"l;

contract ZombieHelper is ZombieFeeding {
    modifier aboveLEvel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level => _level);
        _;
    }
    modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }

  function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombeiId].name = _newName;
  }

  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    require(msg.sender == zombieToOwner[_zombeiId]);
    zombie[_zombeiId].dna = _newDna;
  }

  function getZombiesByOWner(address _owner) external view returns(uint[] memory) {
      uint[] memory result = new uint[](ownerZombieCount[_owner]);
      uint counter = 0;
    for (uint i = 0; i < zombies.length; i++) {
      if (zombieToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
      return result;
  }

}