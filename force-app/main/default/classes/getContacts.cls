public with sharing class getContacts {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactName(){
        List<Contact> lstContact = [Select Id, Name, Email, Phone from Contact Limit 10];
        return lstContact;
    }   
}