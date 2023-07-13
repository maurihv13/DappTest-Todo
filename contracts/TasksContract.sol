// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.6; // Version antigua de solidity

contract TasksContract {

    uint public taskCounter = 0;

    constructor () {
        createTask("mi primer tarea de ejemplo","tengo que hacer algo");
    }

    event TaskCreated(
        uint id,
        string title,
        string description,
        bool done,
        uint createdAt
    );

    event TaskToggleDone(uint id, bool done);

    struct Task {
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt; // Fechas en solidity usan Timestamps
    }

    mapping (uint256 => Task) public tasks; // Estructura de datos tipo llave-valor

    function createTask(string memory _title, string memory _description) public { // 'memory' indica que no se guarde en blockchain sino se use solo memoria temporal
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _title, _description, false, block.timestamp); // 'block' hace referencia al bloque donde se ejecuto el contrato
        emit TaskCreated(taskCounter, _title, _description, false, block.timestamp); // Devuelve informacion sobre la tarea creada, en los datos de transaccion
    }

    function toggleDone(uint _id) public {
        Task memory _task = tasks[_id];
        _task.done = !_task.done; // Cambiar el estado de tarea al contrario
        tasks[_id] = _task;
        emit TaskToggleDone(_id, _task.done);
    }
}
