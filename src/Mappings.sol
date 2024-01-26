//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title An example contract for mappingd
 * @author Kwame 4B
 * @notice i just want to touch mappings to understand, nothing really major.
 */
contract MappingConEx {
    /**
     * @notice A little back story to this contract
     * where i live there is something called a susu box
     * That is what inspired this contract
     * It is a traditional way of saving money when you are a child or kid
     * Evethough the Elderly still F with it
     * it is a small box or cylinder made of wood or hard brown cardboard
     * it has an opening at the top where you insert the money
     * You will never see the money till you are ready to break the box
     * That is to check what you have earned and prolly get what you were saving for.
     * susu = savingsAccount = susubox = box
     */

    /**
     * @notice this is a custom variable type
     * it holds the information of the susu owner
     */
    struct BoxDetails {
        address owner;
        uint256 amount;
    }

    /**
     * @notice In this mapping your key only accesses your amount saved
     */
    mapping(uint256 keyToBox => uint256 amount) public i_SusuBox;
    /**
     * @notice This box is different,
     * Key access address of owner of the box
     * and also accesses the amount the owner has in the box
     */
    mapping(uint256 keyToBox1 => BoxDetails) public i_SusuBox1;

    /**
     * Create a new susu box by entering your private key and amount
     * You can also update the money in the box
     * @param _key uint value that acts as a key to access your box
     * @param _owner address of the owner of account
     * @param amount amount owner has put into the box so far
     */
    function SaveMoneyInYourBox(
        uint256 _key,
        address _owner,
        uint256 amount
    ) public {
        //_owner = msg.sender;
        // susubox 1.0 this only has access to the amount val
        i_SusuBox[_key] = amount;
        //susubox 2.0 this has access to address and amount
        BoxDetails memory mybox = BoxDetails(_owner, amount);
        i_SusuBox1[_key] = mybox;
    }

    /**
     * This checks your updated balance in susubox 1.0
     * @param _key a secret id to access current amount
     */
    function CheckAmount(uint256 _key) external view returns (uint) {
        return i_SusuBox[_key];
    }

    /**
     * This checks box details for susubox2.0
     * @param _key a secret key to access the box details
     */
    function CheckAmountBox1(
        uint256 _key
    ) external view returns (BoxDetails memory) {
        return i_SusuBox1[_key];
    }

    /**
     * This collects savings of both susubox 1.0 & 2.0
     * @param _key The key of the specific box you want to collect savings
     */
    function ClearSavings(uint256 _key) external {
        // susubox 1.0
        delete i_SusuBox[_key];
        //susubox 2.0
        delete i_SusuBox1[_key];
    }
}
