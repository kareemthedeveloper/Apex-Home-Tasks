import { LightningElement, wire } from 'lwc';
import getAllTrainers from '@salesforce/apex/TrainerManager.getTrainer';

export default class TrainerManager extends LightningElement {
    @wire(getAllTrainers)
    trainers;

    get responseReceived(){
        if(this.trainers){
            return true;
        }
        return false;
    }
}