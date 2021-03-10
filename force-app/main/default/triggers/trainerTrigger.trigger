trigger trainerTrigger on Trainer__c (after insert) {
   if(Trigger.isAfter){
       MailToNewTrainer.sendWelcomeEmail(Trigger.new);
   }

}