public with sharing class GetAccount {
    public GetAccount() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> GetAccountDetails()
    {
        return[Select Id, Name, Type, Industry From Account LIMIT 10];
    }
}