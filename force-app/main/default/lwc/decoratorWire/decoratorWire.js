import { LightningElement,wire,track } from 'lwc';
import getTeam from '@salesforce/apex/decoratorTrackClass.getTeam';

export default class DecoratorWire extends LightningElement {
    @track data=[];
    @track columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Record Id',fieldName:'Id'},
    ];

    @wire(getTeam)
    getReocord({data,error}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}