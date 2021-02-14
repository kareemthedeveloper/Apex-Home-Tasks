trigger PrimaryContactTrigger on Contact (after update,before insert, before update) {
     if (Trigger.isBefore && Trigger.isInsert) {
            PrimaryContact.createFirstContactAsPrimaryContact(Trigger.new);
    }
   
}