public class contactTriggerHandler {
    public static void singlePrimaryCustomer(List<Contact> conList){
        Set<Id> accIds = new Set<Id>();
        Map<Id, Contact> conMap = new Map<Id, Contact>();
        for(Contact con : conList){
            accIds.add(con.AccountId);
            conMap.put(con.AccountId, con);
        }
        List<Contact> conList1 = [Select Id, AccountId, Primary_Customer__c From Contact 
                                  Where AccountId IN : accIds];
            for(Contact con : conList1){
                if(con.Primary_Customer__c==true && conMap.get(con.AccountId).Primary_Customer__c==true){
                    con.Primary_Customer__c=false;   
                    update conList1;
                }
            }
    }
}