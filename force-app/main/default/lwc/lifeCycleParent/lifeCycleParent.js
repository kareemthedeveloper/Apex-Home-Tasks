import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {
    /*
      This hook is invoked when a component instance is created,
      To access the host element use 'this.template'
      This method lifecycle flows from parent to child.
      This method in the class will get called first 

      parent constructor called
      parent connCallBack
      child construtor
      child connCallBack
      child renderedCallback
      parent rendered callback
    */
    constructor()
    {
        super()
        console.log('parent constructor call')
    }

     /*
      Then this method will run after
      Use it to: Perform tasks, s.a fetch data, set up caches or listen for events
      To access the host element use 'this.template'
      Do Not Use: to change the state of a component, s.a loading values or setting properties. Use
      Getters and setters instead!
      */
    connectedCallback()
    {
        console.log('parent calling from callback')
    }
    

    /*
      Fires when a component rendering is done. Can fire more than once
      Flows from child to parent. WHen a component gets re-rendered all the expressions used in the template
      are reevaluated. DO NOT USE to change the state or property of a component
    */
    renderedCallback()
    {
        console.log('parent rendering callback')
    }
}