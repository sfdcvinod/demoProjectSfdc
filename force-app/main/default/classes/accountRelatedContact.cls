public class accountRelatedContact {
    public static void getContactRecord(String accountName){
        if(accountName!=null || accountName!=''){
            List<Account> lstAccount = [Select Id, Name, (Select Id, Name from Contacts limit 5) from Account Where Name=:accountName];
            if(!lstAccount.isEmpty()){
                for(Account acc : lstAccount){
                    List<Contact> relatedContacts = acc.Contacts;
                    system.debug('Related Contacts are:'+relatedContacts);
                }
                
            }
        }
    }
        
}