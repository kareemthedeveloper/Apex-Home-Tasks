@isTest public class RestrictCaseWithLimitTest {
   
     @isTest 
     static void CasesInAction(){
          Case[] cases = TestDataFactory.createCases(74);
          
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
