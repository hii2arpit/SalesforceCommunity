import { LightningElement, api } from "lwc";
import { deleteRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin } from "lightning/navigation";

export default class DeleteRecordUsingLDS extends NavigationMixin(LightningElement) {
  @api recordId;
  error;

  deleteRecordMethod(event) {
    alert(this.recordId);
    deleteRecord(this.recordId)
      .then(() => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success",
            message: "Record is deleted.",
            variant: "success"
          })
        );

        this[NavigationMixin.Navigate]({
          type: "standard__webPage",
          attributes: {
            url: "http://salesforce.com"
          }
        });
      })
      .catch((error) => {
        console.log(JSON.stringify(error.message));
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error while deleting",
            message: "Record is not deleted.",
            variant: "Error"
          })
        );
      });
  }
}