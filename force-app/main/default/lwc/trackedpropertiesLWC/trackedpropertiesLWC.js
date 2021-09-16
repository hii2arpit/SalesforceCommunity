import { LightningElement, api, track, wire} from 'lwc';

export default class TrackedpropertiesLWC extends LightningElement {

    @api inputMessage = '';
 
    handleChange(event) {
        console.log('event.target.value' + event.target.value);
        this.inputMessage = event.target.value;
    }
}