trigger RenewalOppTrigger on Opportunity (after update) {
    
        if(Trigger.isUpdate){
           RenewalOpp.oppToOppRenewal(Trigger.new);
       }

    
}