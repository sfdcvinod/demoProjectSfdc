public class accountRating {
    @AuraEnabled(Cacheable=true)
    public static List<Account> accountNameRating(){
        List<Account> acclst = [Select Id, Name, Rating from Account Limit 10];
        return acclst;
    }
}