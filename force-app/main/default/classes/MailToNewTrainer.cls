public with sharing class MailToNewTrainer {
       
    public static void sendWelcomeEmail(List<Trainer__c> trainers){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();

        for(Trainer__c t: trainers){
           if(t.Email__c != null && t.Name != null){
             Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

             List<String> sendTo = new List<String>();
              sendTo.add(t.Email__c);
              mail.setToAddresses(sendTo);

              mail.setReplyTo('kareem.elsayed@smoothstack.com');
              mail.setSenderDisplayName('Gym Owner');


              mail.setSubject('Welcome to the Gym');
              String body = 'Dear ' + t.Name + ', ';
              body += 'Glad to have you on board.';
              body += 'I am Kareem CEO of the your gym.';
              mail.setHtmlBody(body);

             mails.add(mail);
           }

             Messaging.sendEmail(mails);
        }

    }
   
}
