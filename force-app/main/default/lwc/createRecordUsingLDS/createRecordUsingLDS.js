import { LightningElement } from "lwc";
import { createRecord } from "lightning/uiRecordApi";
import Account_Object from "@salesforce/schema/Account";
import Name from "@salesforce/schema/Account.Name";
import Phone from "@salesforce/schema/Account.Phone";

export default class CreateRecordUsingLDS extends LightningElement {
  name;
  phone;

  nameChangeHandler(event) {
    if (event.target.label === "Name") {
      this.name = event.target.value;
    }
  }

  phoneChangeHandler(event) {
    if (event.target.label === "Phone") {
      this.phone = event.target.value;
    }
  }

  createAccount() 
  {
    var objRecordInput;
    const fields = {};
    fields[Name.fieldApiName] = this.name;
    fields[Phone.fieldApiName] = this.phone;

    objRecordInput = { apiName: Account_Object.objectApiName, fields };

    createRecord(objRecordInput)
      .then((response) => {
        alert("Account created with id: " + response.id);
      })
      .catch((error) => {
        alert("Error: --> " + JSON.stringify(error));
      });
  }
}