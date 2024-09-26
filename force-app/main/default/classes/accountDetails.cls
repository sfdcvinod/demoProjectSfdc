public class accountDetails {
    @AuraEnabled(Cacheable=true)
    Public static List<Account> getAccountDetails(string industryName){
        List<Account> accList = [Select Name, Industry from Account Where Industry=:industryName];
            return accList;
    }
}