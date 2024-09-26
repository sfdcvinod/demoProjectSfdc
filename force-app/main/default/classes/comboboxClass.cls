public class comboboxClass {
    @AuraEnabled(Cacheable=true)
    public static List<Account> getAccountId(){
        List<Account> lstAccount = [select Id, Name from Account];
        return lstAccount;
    }
}