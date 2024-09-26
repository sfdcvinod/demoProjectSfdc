public class Product_OfferTriggerHandler {
    Public Static Void flatDiscount(List<Product_Offer__c> productOfferList1){
        for(Product_Offer__c po : productOfferList1){
            if(po.Type__c=='Flat' && po.Flat_Discount__c==null){
                po.Flat_Discount__c.addError('The flat Discount should not blank if type is flat');
            }
            Else if(po.Type__c=='Percentage' && po.Diiscount__c==null){
                po.Diiscount__c.addError('The % Discount should not blank if type is percentage');
            }
        }
    }
    
}