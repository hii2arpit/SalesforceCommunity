import { LightningElement,api } from 'lwc';
import getFilesToDownload from '@salesforce/apex/InvoiceDownload.getFilesToDownload';
export default class DownlopadZiponButtonClick extends LightningElement {
    @api recordId;

    downloadGADSUM()
    {
        getFilesToDownload({})
        .then(result => {
            var files = JSON.parse(response);      
            var zip = new JSZip();
            for(fileName in files)
            {
                var fileBase64String = files[fileName];
                zip.file(fileName, fileBase64String, { base64: true });
            }
        saveAs(zip.generate({type:"blob"}), 'Invoice Download.zip', false);
        confirm('Please confirm to download');
        })
        .catch(error => {
            alert('getting error on load status on send button- ' + error);
        });
    }

}