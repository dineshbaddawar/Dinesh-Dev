import { LightningElement,wire,track } from 'lwc';
import getTeam from '@salesforce/apex/ForEachClass.getTeam';

export default class ForEachLoop extends LightningElement {
    @track data=[];
    @wire(getTeam)
    players;
}