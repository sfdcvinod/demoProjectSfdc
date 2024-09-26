public class getContactDetails {
	@AuraEnabled(Cacheable=true)
    public static List<Contact> getRelatedContactDetails(string contactAccountId){
        List<Contact> lstContact = [Select Id, Name, AccountId, Email, Phone from Contact Where AccountId=:contactAccountId];
        return lstContact;
    }
}