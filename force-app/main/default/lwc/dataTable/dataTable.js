/*
This compnent will be use to create DataTable. DataTable will have functionality of inline edit (Draft Value).
*/
import { LightningElement, api, track, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import getAccounts from "@salesforce/apex/AurasetCallback.getAccounts";
import { updateRecord } from "lightning/uiRecordApi";
import { refreshApex } from "@salesforce/apex";
import RecordId from "@salesforce/schema/Account.Id";
import Name from "@salesforce/schema/Account.Name";
import Phone from "@salesforce/schema/Account.Phone";
import Industry from "@salesforce/schema/Account.Industry";
import AnnualRevenue from "@salesforce/schema/Account.AnnualRevenue";
import Rating from "@salesforce/schema/Account.Rating";

const cols = [
  { label: "Name", fieldName: "Name", editable: "true" },
  { label: "Phone", fieldName: "Phone", editable: "true" },
  { label: "Industry", fieldName: "Industry", editable: "true" },
  { label: "AnnualRevenue", fieldName: "AnnualRevenue", editable: "true" },
  { label: "Rating", fieldName: "Rating", editable: "true" }
];
export default class DataTable extends LightningElement {
  error;
  columns = cols;
  draftValues = [];
  account;

  @wire(getAccounts)
  account;

  // apex wire service as a function
  //   @wire(getAccounts)
  //   wiredContacts({ error, data }) {
  //     if (data) {
  //       //  console.log("account data-->" + JSON.stringify(data));
  //       this.account = data;
  //       this.error = undefined;
  //     } else if (error) {
  //       console.log("account data-->" + JSON.stringify(error));
  //       this.error = error;
  //       this.account = undefined;
  //     }
  //   }

  handleSave(event) {
    const fields = {};

    fields[RecordId.fieldApiName] = event.detail.draftValues[0].Id;
    fields[Name.fieldApiName] = event.detail.draftValues[0].Name;
    fields[Phone.fieldApiName] = event.detail.draftValues[0].Phone;
    fields[Industry.fieldApiName] = event.detail.draftValues[0].Industry;
    fields[AnnualRevenue.fieldApiName] =
      event.detail.draftValues[0].AnnualRevenue;
    fields[Rating.fieldApiName] = event.detail.draftValues[0].Rating;

    const recordInput = { fields };

    updateRecord(recordInput)
      .then(() => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success",
            message: "Record Updated",
            variant: "success"
          })
        );
        // Clear all draft values
        this.draftValues = [];

        // Display fresh data in the datatable
        return refreshApex(this.account);
      })
      .catch((error) => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error during update the record",
            message: error.body.message,
            variant: "error"
          })
        );
      });
  }
}