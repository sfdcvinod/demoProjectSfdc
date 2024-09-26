public class wireDecoratoeforAccount 
{
	@AuraEnabled(cacheable=true)
    public static List<Account> searchAccountDeatils(string industryName)
    {
        List<Account> lstAccount = [Select Name, Industry From Account Where Industry=: industryName];
        return lstAccount;
    }
}