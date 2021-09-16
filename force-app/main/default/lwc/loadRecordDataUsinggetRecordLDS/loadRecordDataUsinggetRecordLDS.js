import { LightningElement, api, wire, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS =['Contact.Name', 'Contact.Phone', 'Contact.Title', 'Contact.Email'];

export default class LoadRecordDataUsinggetRecordLDS extends LightningElement {
    @api recordId;
    contact;
    name;
    phone;
    email;
    title;
    @wire(getRecord, {recordId: '$recordId',fields: FIELDS })
    wireRecord({error, data}){
        if(error){
            let message = 'Unknown Error';
            if(Array.isArray(error.body)){
                message = error.body.map(e => e.message).join(',');
            }else if(typeof error.body.message === 'string '){
                message = error.body.message;
            }
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error loading Record',
                    message,
                    variant: 'error'
                }),
            );
        }else if(data){
            this.contact = data;
            this.name = this.contact.fields.Name.value;
            this.phone = this.contact.fields.Phone.value;
            this.email = this.contact.fields.Email.value;
            this.title = this.contact.fields.Title.value;

        }
    }

}