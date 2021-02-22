trigger GoldenOpportunityTrigger on Opportunity (before insert, after update, before update) {
      if(Trigger.isBefore && Trigger.isInsert){
          GoldenOpportunity.checkOppAmount(Trigger.new);
      }
      else if(Trigger.isAfter){
        GoldenOpportunity.checkOppAmount(Trigger.new);
      }
}
