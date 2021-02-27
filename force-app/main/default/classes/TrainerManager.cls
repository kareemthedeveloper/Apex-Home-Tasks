public inherited sharing class TrainerManager {
    @AuraEnabled(cacheable=true)
    public static List<Trainer__c> getTrainer(){
       return [SELECT Id, Name, Age__c FROM Trainer__c];
    }
}


