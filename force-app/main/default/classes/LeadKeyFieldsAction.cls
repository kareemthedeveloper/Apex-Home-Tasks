public inherited sharing class LeadKeyFieldsAction {
    
    public static void populateKeyFields(List<Lead> leads){
         Map<String,String> leadFields = new Map<String,String>();
         List<String> kWordsCounted = new List<String>();
         List<Task> taskList = new List<Task>();

         Integer count = 1;

         for(Lead myLead: leads){
             leadFields.put('first name ', myLead.FirstName);
             leadFields.put('last name ', myLead.LastName);
             leadFields.put('company ', myLead.Company);
             leadFields.put('email', myLead.Email);
             leadFields.put('phone', myLead.Phone);
             leadFields.put('website', myLead.Website);
             leadFields.put('title', myLead.Title);

            }

          for(String key: leadFields.keySet()){
              String fieldName = leadFields.get(key);
              if(fieldName != null){
                  kWordsCounted.add(fieldName);
                  count+=1;
              }
          }
         
          for(Lead theLead: leads){
              theLead.Key_Fields_Populated__c = count;
              if(theLead.Key_Fields_Populated__c > 3){
                 for(String fieldVals: kWordsCounted){
                     Task t = new Task();
                     t.Subject = 'Quick- Task';
                     t.Status = 'Open';
                     t.Priority = 'Normal';
                     taskList.add(t);
                 }
              }
          }
          insert taskList;

        }
    
     
    

}
