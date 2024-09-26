public class orderLineItemTriggerHandler {
    public static void unitPrice(List<OrderLineItem__c> orderItemList){
        Set<Id> productIds = new Set<Id>();
        Map<Id, OrderLineItem__c> orderLineMap = new Map<Id, OrderLineItem__c>();
        for(OrderLineItem__c ol :orderItemList){
            productIds.add(ol.Product__c);
            orderLineMap.put(ol.Product__c, ol);
        }
        List<Product__c> productList = [Select Id, Offer_Price__c, List_Price__c from Product__c
                                       Where Id IN : productIds];
        for(Product__c pr : productList){
            if(pr.Offer_Price__c!=null){
               orderLineMap.get(pr.Id).Unit_Price__c=pr.Offer_Price__c; 
            }
            else{
                orderLineMap.get(pr.Id).Unit_Price__c=pr.List_Price__c;
            }
        }
        
    }
}