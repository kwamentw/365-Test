//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

/**
 * @title A struct contract
 * @author Kwame 4B
 * @notice i am just trying to familiarize myself with this datatype
 */
contract structExample {
    /**
     * @notice A datatype to hold all details of the employee
     */
    struct Employee {
        string name;
        uint256 age;
        uint256 height;
        bool fulltime;
    }

    // An array to keep records of all employees
    Employee[] public workers;

    /**
     * This function adds a new employee to the list
     * @param _name The name of the employee
     * @param _age How old the employee is
     * @param _height The height of the employee
     * @param _fulltime Detrmines whether worker is full-time or part-time
     */
    function AddEmployee(
        string memory _name,
        uint256 _age,
        uint256 _height,
        bool _fulltime
    ) public {
        workers.push(
            Employee({
                name: _name,
                age: _age,
                height: _height,
                fulltime: _fulltime
            })
        );
        //Another way to upddate the array
        //workers.push(Employee(_name,_age,_height,_fulltime));
    }

    /**
     * This function returns the desired employee
     * @param index to get the location of the desired worker
     */
    function GetEmployee(uint256 index) public view returns (Employee memory) {
        return workers[index];
    }

    /**
     * Gets some specific details of the worker/employee
     * @param index to get location of desired worker
     * @return returns worker's name
     * @return returns worker's age
     * @return returns worker's height
     */
    function GetEmployeeAgeNameHeight(
        uint256 index
    ) public view returns (string memory, uint256, uint256) {
        return (workers[index].name, workers[index].age, workers[index].height);
    }

    /**
     * This function removes the desired employee/worker
     * @param index to get desired worker details
     */
    function RemoveEmployee(uint256 index) public {
        workers[index] = workers[workers.length - 1];
        workers.pop();
    }

    /**
     * This function updates some specific details of the user
     * @param index to get desired worker
     * @param _age new age to be updated
     * @param _height new height to be updated
     * @param _fulltime new status of employee i.e TRUE||FALSE
     */
    function UpdateEmployeeDetails(
        uint256 index,
        uint256 _age,
        uint256 _height,
        bool _fulltime
    ) public {
        workers[index].age = _age;
        workers[index].height = _height;
        workers[index].fulltime = _fulltime;
    }

    /**
     * This function gets all the employees added to the workers array
     */
    function GetAllEmployees() public view returns (Employee[] memory) {
        return workers;
    }
}
