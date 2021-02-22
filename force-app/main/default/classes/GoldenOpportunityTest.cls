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
      List<Opportunity> oppOne = [select id from Opportunity where name like 'Test-Gold-Opp'];
      if(oppOne.size() > 0){
          Opportunity o1 = oppOne.get(0);
           o1.Amount = 25000;
           update o1;
      }
     
      List<Account> acctOne = [select Is_Gold__c from Account where name like 'Should be gold'];
      if(acctOne.size() > 0){
          Account a1 = acctOne.get(0);
          System.assertEquals(true, a1.Is_Gold__c);
      }
    }

    @isTest 
    public static void isNotGoldTest(){
      Opportunity oppTwo = [select id from Opportunity where name like 'Tested-Not-Gold-Opp' limit 1];
      oppTwo.Amount = 6000;
      update oppTwo;
      Account a2 = [select Is_Gold__c from Account where name like 'Should not be gold' limit 1];
      System.assertEquals(false, a2.Is_Gold__c);
    }
}
