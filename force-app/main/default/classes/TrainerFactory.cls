public inherited sharing class TrainerFactory {
   public static void createTrainers(){
       List<Trainer__c> trainers = new List<Trainer__c>();

       for(Integer i = 0; i < 50; i++){
            Trainer__c t = new Trainer__c(name='Test-Trainer '+ i, Age__c=20 + i);
            trainers.add(t);
       }
       insert trainers;
   }
   
}
