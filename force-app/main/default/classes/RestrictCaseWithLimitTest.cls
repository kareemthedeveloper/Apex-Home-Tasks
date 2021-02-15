@isTest public class RestrictCaseWithLimitTest {
     
     @isTest 
     static void CasesInAction(){
          
          Case[] cases = TestDataFactory.createCases(74);
          
          //74 cases created and 26 cases exist in Org
          Integer allCasesCount = [select count() from Case where createdDate =This_Month];
          System.assertEquals(74, allCasesCount);

          Test.startTest();
     try{
          Case c = new Case();
          c.Subject = 'New Subject';
          c.Status = 'New';
          c.Origin = 'Web';
          insert c;
          
      }catch(DmlException e)
      {
        System.Assert(e.getMessage().contains('Too many cases created this month for User: ' + userInfo.getName() + ' with id: ' + UserInfo.getUserId()));
      }
          Test.stopTest();
     }

     @isTest 
     static void RunAsSomeUser(){
          Id sysAdmin = [select id from profile where name like 'System Administrator' limit 1].id;
          User u = [select name from user where profileId =: sysAdmin limit 1];
          
          Case[] cases = TestDataFactory.createCases(74);

     System.runAs(u){
          Test.startTest();
      try{
          Case c = new Case();
          c.Subject = 'New Subject';
          c.Status = 'New';
          c.Origin = 'Web';
          insert c;
          
       }catch(DmlException e)
       {
         System.Assert(e.getMessage().contains('Too many cases created this month for User: ' + userInfo.getName() + ' with id: ' + UserInfo.getUserId()));
       }
          Test.stopTest();
          }
     }

     
}
