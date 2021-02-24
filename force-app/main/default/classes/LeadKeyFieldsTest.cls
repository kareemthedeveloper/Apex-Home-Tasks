@isTest public inherited sharing class LeadKeyFieldsTest {
   @TestSetup
   static void makeData(){
      Lead l1 = new Lead(FirstName='Goku', LastName='Son', Company='CapCorp', Status='Working - Contacted', Title='Alien');
      insert l1;

      Lead l2 = new Lead(LastName='Uzumaki', Company='Leaf Village', Status='Working - Contacted');
      insert l2;
       
   }
   
   @isTest public static void moreFieldsPopulated(){
        List<Lead> gokuLead = [select id, Key_Fields_Populated__c from Lead where FirstName like 'Goku' limit 1];
        if(gokuLead.size() > 0){
           System.assertEquals(5, gokuLead[0].Key_Fields_Populated__c);
        }

        Integer countTasks = [select count() from Task where Subject like 'Quick-Task'];
        if(countTasks > 0){
        System.assertEquals(5, countTasks);
        }
   }

   @isTest public static void lessFieldsPopulated(){
      List<Lead> narutoList = [select id, Key_Fields_Populated__c from Lead where LastName like 'Uzumaki' limit 1];
      if(narutoList.size() > 0){
         System.assertEquals(3, narutoList[0].Key_Fields_Populated__c);
      }

      Integer countTasks = [select count() from Task where Subject like 'Quick-Task'];
        if(countTasks > 0){
        System.assertEquals(0, countTasks);
        }

   }





   
}
