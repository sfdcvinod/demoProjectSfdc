public class contactTrigger1Handler {
    Public static void rollUpInsert(List<Contact> conList){
        Set<Id> accIds = new Set<Id>();
        for(Contact con : conList){
            accIds.add(con.AccountId);
        }
        List<Account> accList = [Select Id, Name, No_of_Contacts__c, (Select Id, AccountId from Contacts) 
                                 from Account Where Id IN :accIds];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.No_of_Contacts__c = acc.Contacts.size();
            }
            update accList;
        }
    }
    Public static void rollUpDelete(List<Contact> conList1){
        Set<Id> accIds1 = new Set<Id>();
        for(Contact con1 : conList1){
            accIds1.add(con1.AccountId);
        }
        List<Account> accList1 = [Select Id, Name, No_of_Contacts__c, (Select Id, AccountId from Contacts) 
                                  from Account Where Id IN :accIds1];
        if(!accList1.isEmpty()){
            for(Account acc1 : accList1){
                acc1.No_of_Contacts__c = acc1.Contacts.size();
            }
            update accList1;
        }
    }
    Public static void rollUpUpdate(List<Contact> conList2){
        Set<Id> accIds2 = new Set<Id>();
        for(Contact con2 : conList2){
            accIds2.add(con2.AccountId);
        }
        List<Account> accList2 = [Select Id, Name, No_of_Contacts__c, (Select Id, AccountId from Contacts) 
                                  from Account Where Id IN :accIds2];
        if(!accList2.isEmpty()){
            for(Account acc2 : accList2){
                acc2.No_of_Contacts__c = acc2.Contacts.size();
            }
            update accList2;
        }
    }
}