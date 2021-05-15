@isTest public inherited sharing class GoldenOpportunityTest {
    @TestSetup
    static void makeData(){
          Account goldAccount = new Account(name='Should be gold');
          Account notGoldAccount = new Account(name='Should not be gold');     
          Opportunity goldenOpp = new Opportunity(name='Tested-Gold-Opp', stageName='Prospecting', CloseDate=Date.today());
          Opportunity notgoldenOpp = new Opportunity(name='Tested-Not-Gold-Opp', stageName='Prospecting', CloseDate=Date.today());     
          insert goldAccount;
          insert notGoldAccount;     
          goldAccount = [select id, name from account where name like 'Should be gold' limit 1];
          notGoldAccount = [select id, name from account where name like 'Should not be gold' limit 1];     
          goldenOpp.accountId = goldAccount.id;
          notgoldenOpp.accountId = notGoldAccount.id;
          insert goldenOpp;
          insert notgoldenOpp;      
    }

    @isTest
    public static void isGoldTest(){
      
      List<Opportunity> oppOne = [select id from Opportunity where name like 'Test-Gold-Opp' limit 1];
      //oppOne[0].Amount = 25000;
      for(Opportunity o: oppOne){
        o.Amount = 25000;
      }
      update oppOne;
      List<Account> acctOne = [select Is_Gold__c from Account where name like 'Should be gold' limit 1];
      System.assertEquals(false, acctOne[0].Is_Gold__c);
      
    }

    @isTest 
    public static void isNotGoldTest(){
      List<Opportunity> oppTwo = [select id from Opportunity where name like 'Tested-Not-Gold-Opp' limit 1];
      oppTwo[0].Amount = 6000;
      update oppTwo;
      List<Account> a2 = [select Is_Gold__c from Account where name like 'Should not be gold' limit 1];
      System.assertEquals(false, a2[0].Is_Gold__c);
    }
}
