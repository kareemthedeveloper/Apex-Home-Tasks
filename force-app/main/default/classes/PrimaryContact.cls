public inherited sharing class PrimaryContact {
    public static void createFirstContactAsPrimaryContact(Contact[] records) {
        
        // New Account Ids, Account Ids already marked with a primary contact
        //Primary_Contact__c
        List<Id> acctId = new List<Id>();
        List<Account> accts = [select id, (select id, Primary_Contact__c from contacts where Primary_Contact__c = true) from Account];
        Map<id, boolean> bool = new map<id, boolean>();

        for(Contact record: records){
           if(record.accountId != null){
               acctId.add(record.accountId);
           }
        }

        for(Account a: accts){
            bool.put(a.id, a.contacts.size()>0 ? true: false);
        }
        for(Contact c : records){
            if(bool.get(c.accountId) == true){
                c.addError('no more primary fields');
            }
        }

    }
}
