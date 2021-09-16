import { LightningElement, api, track, wire } from "lwc";
import getAccounts from "@salesforce/apex/AurasetCallback.getAccounts";
import deleteAccount from "@salesforce/apex/AurasetCallback.deleteAccount";
import deleteSelectedAccount from "@salesforce/apex/AurasetCallback.deleteSelectedAccount";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { refreshApex } from "@salesforce/apex";


const actions = [
  { label: "Record Details", name: "record_detail" },
  { label: "Edit", name: "edit" },
  { label: "Delete", name: "delete" },
  { label: "Clone", name: "clone" }
];

const cols = [
  { label: "Name",  
    fieldName: "recordLink",  
    type: "url",  
    typeAttributes: { label: { fieldName: "Name" }, tooltip:"Name", target: "_blank" }  
  },
  { label: "Phone", fieldName: "Phone", sortable: "true" },
  { label: "Industry", fieldName: "Industry", sortable: "true" },
  { label: "AnnualRevenue", fieldName: "AnnualRevenue", sortable: "true" },
  { label: "Rating", fieldName: "Rating", sortable: "true" },
  {
    type: "action",
    typeAttributes: {
      rowActions: actions,
      menuAlignment: "right"
    }
  }
];

export default class DaatTable_RowAction extends LightningElement {
  data;
  error;
  columns = cols;
  record = [];
  showModal = false;
  recordId;
  isEditForm;
  showLoadingSpinner = false;
  refreshTable;
  recordsCount;
  buttonLabel = "Delete Selected Account"
  isTrue = false;
  selectedRows;
  sortBy;
  sortDirection;

  @wire(getAccounts)
  account({ error, data }) {
    if (data) {
      var tempAccList = [];  
      for (var i = 0; i < data.length; i++) {  
       let tempRecord = Object.assign({}, data[i]); //cloning object  
       tempRecord.recordLink = "/" + tempRecord.Id;  
       tempAccList.push(tempRecord);  
      }  
      this.data = tempAccList;  
      this.error = undefined;  
     } else if (error) {  
      this.error = error;  
      this.oppList = undefined;  
     }  
  }

  // retrieving the data using wire service
  // @wire(getAccounts)
  // account(result) {
  //   this.refreshTable = result;
  //   if (result.data) {
  //     this.data = result.data;
  //     this.error = undefined;

  //   } else if (result.error) {
  //     this.error = result.error;
  //     this.data = undefined;
  //   }
  // }

  //This methos is use for row action
  handleRowAction(event) {
    let actionName = event.detail.action.name;
    let row = event.detail.row;
    //This switch is use for row actions
    switch (actionName) {
      case "record_detail":
        this.currentRecordDetail(row);
        break;
      case "edit":
        this.currentRecordEdit(row);
        break;
      case "delete":
        this.deleteCurrentRecord(row);
        break;
    }
  }

  //This method will call when see the details of the record;
  currentRecordDetail(currentRecord) {
    this.showModal = true;
    this.isEditForm = false;
    this.record = currentRecord;
  }

  //This method will call when edit the record;
  currentRecordEdit(currentRecord) {
    this.showModal = true;
    this.isEditForm = true;
    this.recordId = currentRecord.Id;
  }

  handleSubmit(event) {
    event.preventDefault();
    this.template.querySelector("lightning-record-edit-form").submit(event.detail.fields);
    this.showModal = false;

    this.dispatchEvent(
      new ShowToastEvent({
        title: "Success",
        message: event.detail.fields.Name + " Account Updated Successfully",
        variant: "success"
      })
    );
  }

  //This method is use to refresh the table
  refreshTableData() {
    console.log("Refresh Data after update");
    return refreshApex(this.refreshTable);
  }

  closeModal() {
    this.showModal = false;
  }

  //This method will call when we try to delete any row using row actions
  deleteCurrentRecord(currentRecord) {
    let currentDeletedRecord = [];
    console.log('result ====> ' + currentRecord.Id);
    currentDeletedRecord.push(currentRecord.Id);
    this.showLoadingSpinner = true;

    deleteAccount({ deleteId: currentDeletedRecord })
      .then((result) => {
        window.console.log('result ====> ' + result);
        this.showLoadingSpinner = false;
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success", message: currentRecord.Name + " Account deleted.",
            variant: "success"
          })
        );
        return refreshApex(this.refreshTable);
      })
      .catch((error) => {
        window.console.log('Error ====> ' + error);
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error!!",
            message: error.message,
            variant: "error"
          })
        );
      });
  }


  //This method is use to get the selected checkbox value and numbers of selected checkbox
  getSelectedRow(event) {
    console.log('inside current selection method---------');
    this.selectedRows = event.detail.selectedRows;
    this.recordsCount = event.detail.selectedRows.length;
  }

  //This method will call when you delete selected records by clicking on Delete Selected Record button
  deleteSelectedRecords() {
    console.log('Inside method-->');
    if (this.selectedRows) {
      this.isTrue = true;
      this.buttonLabel = "Processing..";
      this.callApexDeleteMethod();
    }
  }
  //This method is use to call apex method to delete record from database
  callApexDeleteMethod() {
    //var selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();
    deleteSelectedAccount({ acntlist: this.selectedRows })
      .then(result => {
        console.log(JSON.stringify(result));
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Account deleted successfully.",
            variant: "success"
          })
        );
        this.buttonLabel = 'Delete Selected Contacts';
        this.isTrue = false;
        this.recordsCount = 0;
        // Clearing selected row indexs 
        this.template.querySelector('lightning-datatable').selectedRows = [];
        return refreshApex(this.refreshTable);
      })
      .catch(error => {
        alert('Could not be deleted-->' + JSON.stringify(error));
      })
  }

  //This method will call when we try to sort dataTable
  sortTable(event) {
    this.sortBy = event.detail.fieldName;
    this.sortDirection = event.detail.sortDirection;
    this.applySorting(this.sortBy, this.sortDirection);
  }

  //This method is using for sorting the table data
  applySorting(fieldName, direction) {
    let allData = JSON.parse(JSON.stringify(this.data));
    console.log('Parsed Data in the sorting method---> ' + allData);

    // Return the value stored in the field
    let keyValue = (a) => {
      return a[fieldName];
    };

    console.log('check the fieldValue---> ' + keyValue);

    // cheking reverse direction 
    let isReverse = direction === 'asc' ? 1 : -1;
    console.log('check the direction---> ' + isReverse);
    // sorting data 
    allData.sort((x, y) => {
      x = keyValue(x) ? keyValue(x) : ''; // handling null values
      y = keyValue(y) ? keyValue(y) : '';

      // sorting values based on direction
      return isReverse * ((x > y) - (y > x));
    });

    // set the sorted data to data table data
    this.data = allData;
  }

}