import { LightningElement } from 'lwc';

export default class HowOld extends LightningElement {
    age = 23;
    changeHandler(event) {
    this.age = event.target.value;
  }
}