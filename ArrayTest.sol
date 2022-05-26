pragma solidity ^0.8.3;

/*
bytes数组的类型有：bytes1，bytes2，。。。，bytes32，以八个位递增，即是对位的封装
bytes内部自带length长度函数，而且长度固定，而且长度不可以被修改，通过.length可以返回字节长度
bytes1=uint8
bytes2=unit16
......
bytes32=unit256
*/

contract ArrayTest{

    uint[] public numbers = [1,2,3,4];
    address[10] public users = [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db];

    //bytes[] public byteArray;


   
    bytes1 public byB = 0x6a;
    bytes4 public byA = 0x6aaaaabb;

    bytes public byC = "a";

    bytes32 public byD = "abcdefghijk";

    //byte public byD = 0x99;



    function operateArray() public returns(uint){
        numbers.push(10);
        numbers.push(20);

        numbers.pop();

        uint length = numbers.length;

        uint a = numbers[0];


        users[0] = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        users[1] = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;

        length = users.length;
        //固定长度的数组， 不可以使用push()和pop()
        //users.push(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

        //users.push(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);

        //users.pop();

        //byteArray[0] = byB;
        //byteArray[1] = 0x5B38D;
        


         //固定长度的数组， 无法使用push()和pop()
         bytes memory byteA = new bytes(10);
         byteA[0] = 0xAA;
         byteA[1] = 0xBB;
         byteA[2] = 0xCC;

          //长度不对， 运行的时候提示异常transact to ArrayTest.operateArray errored: VM error: revert.
         //byteA[10] = 0xdd;

         return byteA.length;

    }

    function getArrayLen() public view returns(uint) {
        return numbers.length;
    }


    function getBytes1Len() public view returns(uint) {
        return byA.length;
    }

    function getBytesLen() public view returns(uint) {
        return byC.length;
    }

/*
    function getBytesArrayLen() public view returns(uint) {
        return byteArray.length;
    }
*/


    function bytes32ToString(bytes32 _newName) public returns(string memory){

        bytes memory newName = new bytes(_newName.length);

        for(uint i = 0; i < _newName.length;i++) {
            newName[i] = _newName[i];
        }

        return string(newName);
    }

    function stringTobytes() pure public returns(bytes memory){

        string memory str = "ab";
        bytes memory byt = bytes(str);

        return byt;
    }

}


contract Car {
    bytes32 brand;

    uint public price;

    function setBrand(bytes32 _newBrand, uint _newPrice) public {
        brand = _newBrand;
        price = _newPrice;
    }

    function getBrand() view public returns(bytes32) {
        return brand;
    }
}

contract C {

    uint[] public uintArray = [1,2,3,4,5,6];




    function f(uint len) public {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);

        a[6] = 8;
        //a[7] = 9; 编译没有问题， deploy异常

        uint[] storage c = uintArray;


        //uintArray的第一个值改变成7
        c[0] = 7;
        
        //uintArray的第2个值不变
        uint[] memory d = uintArray;
        d[1] = 7;
    }


    function storageToStorage() public {
        uint[] storage uintArrayTemp = uintArray;

        uintArrayTemp[0] = 1000;

    }

    function _storageToMemory(uint[] memory _uintArray) internal pure returns(uint[] memory){
        uint[] memory uintArrayTemp = _uintArray;

        uintArrayTemp[0] = 1000;
        uintArrayTemp[1] = 1000;

        return uintArrayTemp;
    }

    function storageToMemory() public pure returns(uint[] memory, uint[] memory) {
        uint[] memory uintArrayTemp = new uint[](20);

        uintArrayTemp[0] = 1;
        uintArrayTemp[1] = 1;

        return(uintArrayTemp,_storageToMemory(uintArrayTemp));
    }



}

contract d {
    function f() public pure {
        uint[3] memory uintArray = [uint(1), 2, 3];
        g(uintArray);
    }


    function g(uint[3] memory _data) public pure {


    }
}


contract StructTest {
    struct Person {
        string name;
        uint age;
        uint weight;
    }


    Person public personA = Person("Jack", 18, 180);
    Person public personB = Person({name:"Jim",weight:190, age:19});



    function inputStructTest(Person memory _person) public pure returns(Person memory ) {
        return _person;
    }





}
