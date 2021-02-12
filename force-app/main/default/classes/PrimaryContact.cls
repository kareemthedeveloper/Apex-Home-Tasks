public inherited sharing class PrimaryContact {
    public static void createFirstContactAsPrimaryContact(Contact[] records) {
        // New Account Ids, Account Ids already marked with a primary contact
        Set<Id> accountIds = new Set<Id>(), existingIds = new Set<Id>();
        // Get account ids
        for(Contact record: records) {
            accountIds.add(record.AccountId);
        }
        // Get all account Ids that have a primary contact
        existingIds.addAll(new Map<Id, AggregateResult>([
            SELECT AccountId Id
            FROM Contact
            WHERE AccountId IN :accountIds AND Primary_Contact__c = TRUE
            GROUP BY AccountId
        ]).keySet());
        for(Contact record: records) {
            // If existingIds.add() returns true, there was no previous primary contact
            record.Primary_Contact__c = existingIds.add(record.AccountId);
        }
    }

}
