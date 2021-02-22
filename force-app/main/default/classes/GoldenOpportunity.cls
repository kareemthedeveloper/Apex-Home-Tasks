public inherited sharing class GoldenOpportunity {
   
    public static void checkOppAmount(List<Opportunity> opps){
        List<Account> accts = [select id,  Is_Gold__c from  Account];

        for(Opportunity o: opps){
           for(Account a: accts){
            if(o.Amount > 20000){
                a.Is_Gold__c = true;
            }
          }
        }
    }

}
