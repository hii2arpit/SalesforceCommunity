import { LightningElement, api, track , wire } from 'lwc';

export default class FirstLWC extends LightningElement {
    @api inputMessage = 'Arpit';

    handleChange(event)
    {
        this.inputMessage = event.target.value;
    }
}