public inherited sharing class GoldenOpportunity {
   
    public static void checkOppAmount(List<Opportunity> opps){
        Set<Id> aId = new Set<Id>();
        
        for(Opportunity o: opps){
            aId.add(o.AccountId);
        }
      
      List<Account> accts = [select id,Is_Gold__c, (Select Id from Opportunities where Amount > 20000) from Account where Id in:aId];
      
      for(Account a: accts){
          a.Is_Gold__c = true;
      }

        
    }


}
