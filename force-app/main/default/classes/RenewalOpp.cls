public inherited sharing class RenewalOpp {
    
    public static void oppToOppRenewal(List<Opportunity> opps){
         
        List<Opportunity> renewals = new List<Opportunity>();
         
         for(Opportunity o: opps){
             if(o.StageName == 'Closed Won'){
                 Opportunity Arenewal = new Opportunity();
                 //Opportunity Brenewal = new Opportunity();
                 //Arenewal.Name = o.Name + ‘Renewal’;

                 Arenewal.AccountId = o.AccountId;
                 Arenewal.CloseDate = o.CloseDate + 365; 
                 Arenewal.StageName = 'Open';
                 //Arenewal.RecordTypeId = o.RecordTypeId;
                 Arenewal.OwnerId = o.OwnerId;
                 renewals.add(Arenewal);

            }
         
          }
           if(renewals.size() > 0){
                insert renewals;
            }
   } 

  

}