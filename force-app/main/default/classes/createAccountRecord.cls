public class createAccountRecord {
	@AuraEnabled
    public static List<Account> createAccountWithApex(string accountNames, string accountIndustries){
        List<Account> lstAccount = new List<Account>();
        if(accountNames!=null){
            Account acc = new Account();
            acc.Name = accountNames;
            acc.Industry = accountIndustries;
            lstAccount.add(acc);
        }
        if(!lstAccount.isEmpty()){
            insert lstAccount;
            return lstAccount;
        }
        return null;
    }
}