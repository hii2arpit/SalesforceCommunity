import { LightningElement, api, track, wire } from 'lwc';

export default class Lwc_DynamicallyTrackProperties_2 extends LightningElement {

    name='Arpit';
    empName='Creative Systems';

    handleChange(event)
    {
        this.name = event.target.value;
    }

    empUpdate(event)
    {
        this.empName = "Creative Systems and Consulting";
    }
}