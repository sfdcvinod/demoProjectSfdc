public class impeartiveExample 
{
	@AuraEnabled (Cacheable=true)
    public static List<Account> fetchAccountRecord()
    {
        List<Account> lstAcc=[Select Id, Name, Rating From Account Limit 10];
        Return lstAcc;
    }
}