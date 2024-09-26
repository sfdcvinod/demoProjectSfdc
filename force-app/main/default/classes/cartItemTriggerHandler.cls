public class cartItemTriggerHandler {
    Public Static void totalAmount(List<Cart_Item__c> cartItemList1){
        Set<Id> productIds = new Set<Id>();
        for(Cart_Item__c ci : cartItemList1){
            productIds.add(ci.Product__c);
        }
        List<Product__c> ProductList1 = [Select Id, Offer_Price__c, Offer_Available__c, List_Price__c, 
                                         (Select Id, Product__c from Cart_Items__r) from Product__c Where Id IN :productIds];
        for(Product__c pr : ProductList1){
            for(Cart_Item__c ci : cartItemList1){
                if(pr.Offer_Available__c == true){
                    ci.Amount__c = pr.Offer_Price__c;
                }
                else{
                    ci.Amount__c=pr.List_Price__c;
                }   
            }
        }
    }
}