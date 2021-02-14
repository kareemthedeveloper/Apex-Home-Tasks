public inherited sharing class RenewalOpp {
    
    public static void createRenewalOpp(List<Opportunity> opps){
         
        List<Opportunity> renewals = new List<Opportunity>();
        //Id RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName('Renewal').getRecordTypeId();

         for(Opportunity o: opps){
             if(o.StageName.contains('Closed Won')){
                 Opportunity renewal = new Opportunity();
                 renewal.AccountId = o.AccountId;
                 renewal.Name = o.Name + ' Renewal';
                 renewal.CloseDate = o.CloseDate.addYears(1); 
                 renewal.StageName = 'Open';
                // renewal.RecordTypeId = RecordTypeId;
                 renewal.OwnerId = o.OwnerId;
                 renewals.add(renewal);

            }
         
          }
        insert renewals;
        
   } 

  

}