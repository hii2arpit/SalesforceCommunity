import { LightningElement, track, api } from 'lwc';

export default class App extends LightningElement {

    constructor(){
        super();
        console.log('constructor - child');
    }

    connectedCallback(){
        console.log('connectedcallback - child');
    }

    renderedCallback(){
        console.log('renderedCallback - child');
    }

}