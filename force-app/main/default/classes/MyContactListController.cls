public with sharing class MyContactListController {
    
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId){
        try {
            return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId = :recordId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}