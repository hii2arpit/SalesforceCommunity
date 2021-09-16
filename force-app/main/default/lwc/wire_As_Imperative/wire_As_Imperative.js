import { LightningElement, wire, track } from 'lwc';
import getallContacts from '@salesforce/apex/AurasetCallback.getallContacts';

export default class Wire_As_Imperative extends LightningElement {

    contacts;
    error;

    loadContacts(){
        getallContacts()
        .then(result =>{
            this.contacts = result;
        })
        .catch(error =>{
            this.error = error;
        });
    }
}