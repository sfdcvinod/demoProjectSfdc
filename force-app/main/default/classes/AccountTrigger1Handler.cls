public class AccountTrigger1Handler {
    Public static void avoidDuplicateRecord(List<Account> lstAccount1){
        // Collection of requird data        
        List<String> nameList = new List<String>();
        for(Account acc : lstAccount1){
            nameList.add(acc.Name);
        }
        // Fire SOQL Query
        List<Account> lstAccount = [Select Id, Name from Account Where Name IN : nameList];
        // Logic for Result
        if(lstAccount.size()>0){
            for(Account acc : lstAccount1){
                acc.addError('Duplicate name found');
            }
            
        }
    }
}