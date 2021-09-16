import { LightningElement} from 'lwc';

export default class App extends LightningElement {

    constructor(){
        super();
        console.log('constructor -grandparent');
    }

    connectedCallback(){
        console.log('connectedcallback -grandparent');
    }

    renderedCallback(){
        console.log('renderedCallback -grandparent');
    }

}