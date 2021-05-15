trigger GoldenOpportunityTrigger on Opportunity (before insert, after update, before update) {
      if(Trigger.isBefore || Trigger.isAfter){
          GoldenOpportunity.checkOppAmount(Trigger.new);
      }
      else if(Trigger.isUpdate){
        GoldenOpportunity.checkOppAmount(Trigger.new);
      }
}
