import { LightningElement, api, wire, track } from 'lwc';
import Subject_FIELD from '@salesforce/schema/Case.Subject';
import Description_FIELD from '@salesforce/schema/Case.Description';
import Status_FIELD from '@salesforce/schema/Case.Status';
import Priority_FIELD from '@salesforce/schema/Case.Priority';

export default class Createandview_RecordEdit_and_ViewForm extends LightningElement {

    saveRecordId;

    saveRecord(event)
    {
        this.saveRecordId = event.detail.id;
    }

    @api recordId;
    @api objectApiName;

    fields = [Subject_FIELD, Description_FIELD, Status_FIELD,Priority_FIELD];

    handleSubmit(event){
        event.preventDefault();       // stop the form from submitting
        const fields = event.detail.fields;
        fields.LastName = 'My Custom Last Name'; // modify a field
        this.template.querySelector('lightning-record-form').submit(fields);
     }

}