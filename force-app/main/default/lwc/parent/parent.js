import { LightningElement, track, api } from 'lwc';

export default class App extends LightningElement {

    constructor(){
        super();
        console.log('constructor - parent');
    }

    connectedCallback(){
        console.log('connectedcallback - parent');
    }

    renderedCallback(){
        console.log('renderedCallback - parent');
    }

}