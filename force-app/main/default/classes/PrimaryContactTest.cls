
@isTest public inherited sharing class PrimaryContactTest {
    //Use test data factory
    //runAs (SysAdmin)
    
    @TestSetup
    static void makeData(){
        Account a = new Account(name = 'testing INC');
        insert a;

        Id acctID = a.Id;

        Contact c1 = new Contact(FirstName='Joe',
          LastName = 'Schmoe',
          Primary_Contact__c = true,
          AccountId = a.Id);
       insert c1;


    }

    @isTest public static void ContactIsPrimary(){
      Contact con = [select id, Primary_Contact__c from Contact where FirstName = 'Joe' and LastName = 'Schmoe' limit 1];

      System.assertEquals(true, con.Primary_Contact__c);
    }

     @isTest public static void ContactIsNotPrimary(){
    
      try{
         Id acctId = [select id from Account where name = 'testing INC'].id;
         Contact c2 = new Contact(FirstName='Joey',
          LastName = 'Chill',
          Primary_Contact__c = true,
          AccountId = acctId);
       insert c2;
          
      }catch(DmlException e)
      {
        System.Assert(e.getMessage().contains('no more primary fields'));
      }
    
    }


    /*
      Id SysAdmin = [select id from profile where name like 'System Administrator'].id;
        User u1 = [select name from User where profileid =: SysAdmin limit 1];  
        
        System.runAs(u1){
          Contact c = [select name, Primary_Contact__c from Contact where name like 'Larry'];
          System.assertEquals(true, Primary_Contact__c);

        }
   
      @isTest public static void ContactIsNotPrimary(){
        Id SysAdmin = [select id from profile where name like 'System Administrator'].id;
        User u2 = [select name from User where profileid =: SysAdmin limit 1];

          System.runAs(u1){
          Contact c = [select name, Primary_Contact__c from Contact where name like 'Angelo'];
          System.assertEquals(false, Primary_Contact__c);

        }

      }
    */
   
}
