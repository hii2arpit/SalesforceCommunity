import { LightningElement, api, wire, track } from "lwc";
import getSearchedAccounts from "@salesforce/apex/AurasetCallback.getSearchedAccounts";

const column = [
  { label: "Id", fieldName: "Id" },
  { label: "Name", fieldName: "Name" },
  { label: "Website", fieldName: "Website" },
  { label: "Industry", fieldName: "Industry" },
  { label: "Rating", fieldName: "Rating" },
  { label: "Account Source", fieldName: "AccountSource" }
];
export default class Wire_SearchRecord extends LightningElement {
  listaccounts;
  error;
  columnslist = column;
  noRecords = true;
  @api searchKey = "";

  //This method is using for getting the search key from input and get the accounts based on that.
  @wire(getSearchedAccounts, { name: "$searchKey" })
  accounts;

  //This method is using for get the updated key value everytime
  keyChange(event) {
    const key = event.target.value;
    this.searchKey = key;
  }

  //This method is use for getting the account record based on the value we entered in input text.
  findAccounts(event) {
    const name = event.target.value; //Here the constant name varibale should be same as class method parameter in terms of name of the parameter.
    // console.log(name);

    if (name) {
      getSearchedAccounts({ name })
        .then((result) => {
          // console.log(JSON.stringify(result));
          this.listaccounts = result;
          this.noRecords = false;
        })
        .catch((error) => {
          this.error = error;
        });
    } else {
      this.listaccounts = undefined;
      this.noRecords = true;
    }
  }
}