trigger RenewalOppTrigger on Opportunity (after update) {
    
        if(Trigger.isUpdate){
           RenewalOpp.createRenewalOpp(Trigger.new);
       }

    
}