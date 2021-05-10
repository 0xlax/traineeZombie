pragma solidity >=0.5.0 <0.6.0;
import "./Ownable.sol";
import "./SafeMath.sol";

contract ZombieFactory is Ownable {
    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;
    uint256 cooldownTime = 1 days;
    using SafeMath for uint256;
    using SafeMath16 for uint16;
    using SafeMath32 for uint32;

    event NewZombie(uint256 zombieId, string name, uint256 dna);

    mapping(uint256 => address) public zombieToOwner;
    mapping(address => uint256) ownerZombieCount;

    struct Zombie {
        string name;
        uint256 dna;
        uint32 level;
        uint32 readyTime;
        uint16 winCount;
        uint16 loseCount;
    }
    Zombie[] public zombies;

    function _createZombie(string memory _name, uint256 _dna) internal {
        uint256 id =
            zombies.push(
                Zombie(_name, _dna, 1, uint32(now + cooldownTime), 0, 0)
            ) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender] = ownerZombieCount[msg.sender].add(1);
        emit NewZombie(id, _name, _dna);
    }

    function _generateRadsomDna(string memory _str)
        private
        view
        returns (uint256)
    {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint256 randDna = _generateRadsomDna(_name);
        _createZombie(_name, randDna);
    }
}
