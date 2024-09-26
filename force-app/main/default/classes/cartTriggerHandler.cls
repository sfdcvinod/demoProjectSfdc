public class cartTriggerHandler {
    public static void primaryCustomer(List<Cart1__c> cartList1){
        Set<Id> accIds = new Set<Id>();
        Map<Id, Cart1__c> cartMap = new Map<Id, Cart1__c>();
        for(Cart1__c ct : cartList1){
            accIds.add(ct.Account__c);
            cartMap.put(ct.Account__c, ct);
        }
        List<Contact> conList = [Select Id, Primary_Customer__c, AccountId from Contact 
                                 Where AccountId IN : accIds];
        for(Contact con : conList){
            if(con.Primary_Customer__c){
                cartMap.get(con.AccountId).Customer__c = con.Id;
            }
        }
    }
}