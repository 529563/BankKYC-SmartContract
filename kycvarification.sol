// SPDX-License-Identifier: MIT
pragma solidity ^0.5.11;
contract BankKYC {
    struct Bankinfo {
        string Bankname;
        address BankAddressess;
        uint256 KYCcount;
        bool CanAddCustomer; 
        bool CanDoKYC;
    }
    struct Customerinfo {
        string CustomerName;
        string CustomerData; 
        address CutomerBank;
        bool KYCStatus;
    }

mapping (address => Bankinfo) Bank;
mapping (string => Customerinfo) Customer;

function AddNewBank (string memory _BankName, address _BankAddress) public {
    Bank[_BankAddress]=Bankinfo(_BankName, _BankAddress, 0, true, true);
    }

function AddNewCustomer (string memory _CustomerName, string memory _CustomerData) public {
    Customer[_CustomerName]= Customerinfo(_CustomerName, _CustomerData, msg.sender, false);
}

function BlockBankfromAddingCustomer (address _BankAddress) public {
    Bank[_BankAddress].CanAddCustomer=false;
}

function BlockBankfromDoinKYC (address _BankAddress) public {
    Bank[_BankAddress].CanDoKYC=false;
}
function AllowBankfromAddingCustomer (address _BankAddress) public {
    Bank[_BankAddress].CanAddCustomer=true;
}
function AllowBankfromDoinKYC (address _BankAddress) public {
    Bank[_BankAddress].CanDoKYC=true;
}
function UpdateKYCstatus (string memory _CustomerName) public {
    Customer[_CustomerName].KYCStatus=true;
    Bank[msg.sender].KYCcount++;
}
function ViewCustomerData (string memory _CustomerName) public view returns (string memory, bool) {
    return(Customer[_CustomerName].CustomerData, Customer[_CustomerName].KYCStatus);
}
function ViewBankinfo (address _add) public view returns (bool, bool, uint256) {
    return(Bank[_add].CanAddCustomer,Bank[_add].CanDoKYC,Bank[_add].KYCcount );
}

}