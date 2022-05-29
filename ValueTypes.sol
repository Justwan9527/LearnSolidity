pragma solidity ^0.8.10;


contract ValueType {

    //整型
    int public _int = -1;

    int public _intMax = 2**255 - 1;

    int public _intMin = -2**255;

    //address
    address public _address = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    uint256 public _balance = _address.balance;

    uint160 public _uint160 = uint160(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);


    address public _addressFromUint160 = address(_uint160);


    //array
    bytes32 public _byte32 = "MiniSolidity";//实际会补齐到32字节，输出为 0x4d696e69536f6c69646974790000000000000000000000000000000000000000

    bytes1 public _byte1 = 0xab;

    bytes[] public _byteArray;//初始化分配值的话会报错
    

    function setByteArray() public {
        bytes memory _bytesA = new bytes(9);
        _bytesA[0] = 0xab;
        _bytesA[1] = 0xab;
        _bytesA[2] = 0xab;

        _byteArray.push(_bytesA);


        bytes memory _bytesB = new bytes(20);
        _bytesB[0] = 0xab;
        _bytesB[1] = 0xab;
        _bytesB[2] = 0xab;
        _byteArray.push(_bytesB);

    }

    //枚举
    enum Language {
        CN,
        EN,
        DE
    }

    Language public _languageA = Language.CN;
    Language public _langguageB = Language(1);


}
