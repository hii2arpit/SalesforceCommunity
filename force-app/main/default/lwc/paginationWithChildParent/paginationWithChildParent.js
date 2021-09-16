import { LightningElement } from 'lwc';
//import getContacts from '@salesforce/apex/AurasetCallback.getContacts';

export default class PaginationWithChildParent extends LightningElement {

    //This will call when user will click on previous button
    previousHandler() {
        const prv = new CustomEvent('previous');
        this.dispatchEvent(prv);
    }

    //This will call when user will click on next button
    nextHandler() {
        this.dispatchEvent(new CustomEvent('next'));
    }

}