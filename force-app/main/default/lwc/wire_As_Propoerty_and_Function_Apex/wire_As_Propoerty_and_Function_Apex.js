import { LightningElement, wire, api, track } from 'lwc';
import getContacts from '@salesforce/apex/AurasetCallback.getContacts';
import getAccountList from '@salesforce/apex/AurasetCallback.getAccountList';

export default class Wire_As_Propoerty_and_Function_Apex extends LightningElement {

    contacts;
    error;
    funcontacts;
    funerror;
    @track options=[];
    makeVisible = false;
    pick;
    name;
    email;
    phone;
    @api name='Arpit Jain';

    getEmail(event) {
        this.email = event.target.value;
    }
    getPhone(event) {
        this.phone = event.target.value;
    }

    getName(event) {
        this.name = event.target.value;
    }
    handleChange(event){
        this.pick = event.target.value;
    }


    //Wire as property
    @wire(getContacts,{name:'Arpit Jain'})
    contacts;

    renderedCallback(){
        if(this.options.length == 0){
           getAccountList()
           .then(data => {
               if(data){
                   const temp = { label: 'None', value: 'None' };
                   this.options = [ ...this.options, temp ];
                   for(var item of data) {
                       var acc = { label: item.Name, value: item.Name };
                       this.options = [ ...this.options, acc ];
                   }
               }
           })
           .catch(error => {
               console.log('error');
           });
        }
    }
    // Wire as function
    @wire(getContacts,{name:'Arpit Jain'})
    cont({error, data}){
        if(data){
            this.funcontacts = data;
            this.funerror = undefined;
        }
        else if(error){
            this.funcontacts = undefined;
            this.funerror = error;
        }
    }


    handleSave(event) {

        this.makeVisible = true;
     }
}