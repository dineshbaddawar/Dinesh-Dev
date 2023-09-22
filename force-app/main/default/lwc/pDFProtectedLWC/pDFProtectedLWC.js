import { LightningElement,api,track } from 'lwc';
export default class PDFProtectedLWC extends LightningElement {
    connectedCallback() {
        this.generatePDFPassword();
    }

}