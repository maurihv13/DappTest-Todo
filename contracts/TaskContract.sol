pragma solidity ^0.8.6; // Version antigua de solidity

contract TaskContract {

    struct Task {
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt; // Fechas en solidity usadas con Timestamps
    }

    mapping (uint256 => Task) public tasks; // Estructura de datos tipo llave-valor

    function createTask(){}
    // Referencia video: https://youtu.be/FAMWIoKvfRs?t=1580


}
