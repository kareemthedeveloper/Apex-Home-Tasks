@isTest
public class RenewalOppTest {
     @TestSetup
     static void makeData(){
        Account acc = new Account(Name = 'Test-Renewal-Opp');
        Opportunity testOpp = new Opportunity();
        testOpp.Name = 'Renewal Opportunity';
        testOpp.StageName = 'Prospecting';
        testOpp.AccountId = 'Test-Renewal-Opp';

        insert testOpp;

        
     }
     @isTest static void getData(){
        Opportunity opp = [SELECT id, AccountId FROM Opportunity WHERE name = 'Renewal Opportunity' LIMIT 1];
        
   
          
        
        

     }

}
