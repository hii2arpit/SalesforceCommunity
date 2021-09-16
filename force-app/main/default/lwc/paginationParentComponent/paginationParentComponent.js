import { LightningElement, api, wire, track } from 'lwc';
import getContacts from '@salesforce/apex/AurasetCallback.getContacts';

const cols = [
    { label: "Id", fieldName: "Id" },
    { label: "Name", fieldName: "Name" },
    { label: "Phone", fieldName: "Phone" },
    { label: "Email", fieldName: "Email" },
    { label: "Account Name", fieldName: "Id.Account.Name" },
];

let i = 0;
export default class PaginationParentComponent extends LightningElement {

    totalRecordCount = 0;
    startingRecordOnPage = 1;
    endingRecordOnPage = 0;
    totalPageCount = 0;
    pageSize = 5;
    page = 1; //This will initilize first page
    tableData = [];
    columns = cols;
    items = []; //It will contain all records

    @wire(getContacts)
    wireContacts({ error, data }) {
        if (data) {
            console.log(JSON.stringify(data.Account));
            this.items = data;
            this.totalRecordCount = data.length;
            this.totalPageCount = Math.ceil(this.totalRecordCount / this.pageSize);
            this.tableData = this.items.slice(0, this.pageSize);
            this.endingRecordOnPage = this.pageSize;

            this.error = undefined;
        }
        this.data = undefined;
        this.error = error;
    }

    previousHandler() {
        if (this.page > 1) {
            this.page = this.page - 1;
            this.displayRecordPerPage(this.page);
        }
    }


    nextHandler() {
        console.log('check page value->' + this.page + 'check totalPageCount--->' + this.totalPageCount);
        if ((this.page < this.totalPageCount) && (this.page !== this.totalPageCount)) {
            this.page = this.page + 1;
            console.log('Later apge value-->' + this.page);
            this.displayRecordPerPage(this.page);
        }
    }

    //This method will call from next and previous handler methods to get the data on next page.
    displayRecordPerPage(page) {
        this.startingRecordOnPage = ((page - 1) * this.pageSize);
        console.log('Check the startingRecordonPage------->' + this.startingRecordOnPage);
        this.endingRecordOnPage = (this.pageSize * page);
        this.endingRecordOnPage = (this.endingRecordOnPage > this.totalRecordCount) ? this.totalRecordCount : this.endingRecordOnPage;
        this.tableData = this.items.slice(this.startingRecordOnPage, this.endingRecordOnPage);
        this.startingRecordOnPage = this.startingRecordOnPage + 1;
    }
}