public class GetChild {
@AuraEnabled
    public static List<Account> getContactDetails(){
        List<Account> accList = [Select Id, Name, (Select Name, FirstName, LastName from Contacts) from Account Limit 3];
        if(!accList.isEmpty()){
            return accList;
        }
        return null;
    }
}