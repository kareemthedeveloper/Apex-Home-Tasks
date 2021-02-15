@isTest public inherited sharing class TestDataFactory {
    
     public static List<Case> createCases(Integer numOfCases) {
          List<Case> cases = new List<Case>();
          for(Integer counter = 0; counter < numOfCases; counter++){
              Case c = new Case();
              c.Subject = 'Subject ' + counter;
              c.Status = 'New ';
              c.Origin = 'Web';

              cases.add(c);
          }
          insert cases;

          return cases;
    }
    /*
    //creates Accounts with Contacts 
    public static List<Account> createAccountsWithContacts(Integer numAccts, Integer numCtacts){
        List<Account> accts = new List<Account>();
        for(Integer i = 0; i < numAccts; i++){
            Account acct = new Account(Name = 'Manufactored Test Account ' + i);
            accts.add(a);
        }
        insert accts;

        List<Contact> ctacts = new List<Contact>();
            for(Integer j = 0; j < numAccts; j++){
                Account account = accts[j];
                for(Integer k = 0; k < numCtacts; k++){
                    ctacts.add(new Contact(LastName = 'Manufactored Test Contact ' + k, AccountId = account.id));
                }
            }
         insert ctacts;
        
        return accts;
        }
    
    */

    
}





