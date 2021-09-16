import { LightningElement, api, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AurasetCallback.getAccounts';
import { getPicklistValues, getObjectInfo } from 'lightning/uiObjectInfoApi';
import Account_Object from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import PHONE_FIELD from "@salesforce/schema/Account.Phone";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import Test_FIELD from "@salesforce/schema/Account.Test__c";
import { createRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const cols = [
    { label: "Name", fieldName: "Name" },
    { label: "Phone", fieldName: "Phone" },
    { label: "Industry", fieldName: "Industry" },
    {
        label: 'View',
        type: 'button-icon',
        initialWidth: 75,
        typeAttributes: {
            title: 'View Details',
            alternativeText: 'View Details',
            iconName: 'action:info'
        }
    }
];

export default class PicklistANDNavigation extends NavigationMixin(LightningElement) {

    data;
    error;
    columns = cols;
    name;
    phone;
    allIndustryValues;
    industry;
    test = [];
    alltestvalues;

    handleNameChange(event) {
        if (event.target.label === 'Name') {
            //  console.log('inside Name field---------------------- Value---' + event.target.value);
            this.name = event.target.value;
        }
    }

    handlePhoneChange(event) {
        if (event.target.label === 'Phone') {
            //  console.log('inside Phone field---------------------- Value---' + event.target.value);
            this.phone = event.target.value;
        }
    }

    handleIndustryChange(event) {
        console.log('inside Industry field----------------------');

        if (event.target.label === 'Select Industry') {
            console.log('inside Industry field---------------------- Value---' + event.target.value);
            this.industry = event.target.value;
        }
    }

    handleChange(event)
    {
            alert('inside test field----------------------' + event.target.value);
            this.test = event.target.value;

        var array = this.test;
        var str = "";
        // var arraylength = array.length;
        if (array.length > 0) {
            for (var i in array) {
                console.log('Testing Dualist value-->' + array[i]);
                if (i == 0) {
                    str = str + array[i];
                } else {
                    str = str + ";" + array[i];
                }
                //str=str+array[i]+";";
                console.log('Testing Dualist value after_______' + str);
            }
        }
        console.log('Testing Dualist value after all Done~~~~~~~~~~~~~~>' + str);
        this.test = str;
        }



    handleRowAction(event) {
        const row = event.detail.row;
        this.record = row;
        this[NavigationMixin.Navigate]({
            // type: 'standard__recordPage',
            // attributes: {
            //     recordId: row.Id,
            //     actionName: 'view',
            // },
            type: 'standard__webPage',
            attributes: {
                url: '/apex/pdf'
            },
        });
    }

    //Loads the account data on load of the page.
    @wire(getAccounts)
    account;


    //Getting picklist value
    @wire(getObjectInfo, {
        objectApiName: Account_Object
    }) accountObjectInfo;

    //Getting picklist value and assign that value to the property;
    @wire(getPicklistValues, {
        recordTypeId: '$accountObjectInfo.data.defaultRecordTypeId',
        fieldApiName: INDUSTRY_FIELD
    })
    wiredIndustryPicklistValues({ data, error }) {
        if (data) {
            this.allIndustryValues = data.values;
            this.error = undefined;
        }
        else {
            this.allIndustryValues = undefined;
            this.error = error;
        }
    }

    //Getting picklist value and assign that value to the property;
    @wire(getPicklistValues, {
        recordTypeId: '$accountObjectInfo.data.defaultRecordTypeId',
        fieldApiName: Test_FIELD
    })
    wiredTestPicklistValues({ data, error }) {
        if (data) {
            this.alltestvalues = data.values;
            this.error = undefined;
        }
        else {
            this.alltestvalues = undefined;
            this.error = error;
        }
    }

    

    createAccount() {
        var recordInput;
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.name;
        fields[PHONE_FIELD.fieldApiName] = this.phone;
        fields[INDUSTRY_FIELD.fieldApiName] = this.industry;
        fields[Test_FIELD.fieldApiName] = this.test;
        console.log('Check the value of fileds---->' + NAME_FIELD + ' ------------> ' + PHONE_FIELD +
                     ' ---------------> ' + INDUSTRY_FIELD + '--->>>' + Test_FIELD);

        recordInput = { apiName: Account_Object.objectApiName, fields };

        console.log('Check the value which is going toi save--->' + JSON.stringify(recordInput));
        createRecord(recordInput)
            .then(response => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'SUCCESS',
                        message: 'Account created successfully',
                        variant: 'success',
                    }),
                );
                this.name = '';
                this.phone = '';
                this.industry = '';
                this.test = '';
                return refreshApex(this.account)
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Record creation error',
                        message: error.message,
                        variant: 'error',
                    }),
                );
            });
    }
}