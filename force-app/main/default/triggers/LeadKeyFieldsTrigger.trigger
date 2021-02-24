trigger LeadKeyFieldsTrigger on Lead (before insert) {
     if(Trigger.isBefore){
         LeadKeyFieldsAction.populateKeyFields(Trigger.new);
     }
}