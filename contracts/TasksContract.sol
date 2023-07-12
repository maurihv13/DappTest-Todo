// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.6; // Version antigua de solidity

contract TasksContract {

    uint public taskCounter = 0;

    struct Task {
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt; // Fechas en solidity usan Timestamps
    }

    mapping (uint256 => Task) public tasks; // Estructura de datos tipo llave-valor

    function createTask(string memory _title, string memory _description) public { // 'memory' indica que no se guarde en blockchain sino se use solo memoria temporal
        tasks[taskCounter] = Task(taskCounter, _title, _description, false, block.timestamp); // 'block' hace referencia al bloque donde se ejecuto el contrato
        taskCounter++;
    }

    // function toggleDone() {}
}
