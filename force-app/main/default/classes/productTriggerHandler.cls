public class productTriggerHandler {
    Public static void offerAvailable(List<Product__c> productList1){
        Set<Id> productOfferIds = new Set<Id>();
        for(Product__c pr : productList1){
            productOfferIds.add(pr.Product_Offer__c);
        }
        List<Product_Offer__c> productOfferList = [Select Id, Expired__c from Product_Offer__c Where Id IN : productOfferIds];
        
        for(Product__c pr :productList1){
            for(Product_Offer__c po :productOfferList){
                if(po.Expired__c==false){
                    pr.Offer_Available__c=true;
                }  
            }
        }
    }
    Public static void offerPrice(List<Product__c> productList2){
        Set<Id> productOfferIds = new Set<Id>();
        for(Product__c pr : productList2){
            productOfferIds.add(pr.Product_Offer__c);
        }
        List<Product_Offer__c> productOfferList = [Select Id,Diiscount__c, Flat_Discount__c from Product_Offer__c 
                                                   Where Id IN : productOfferIds];
        for(Product_Offer__c po :productOfferList){
            for(Product__c pr : productList2){
                if(pr.Offer_Available__c==true){
                    if(po.Diiscount__c!=null){
                        pr.Offer_Price__c = pr.List_Price__c - (pr.List_Price__c*po.Diiscount__c/100);       
                    }
                    else if(po.Flat_Discount__c!=null){
                        pr.Offer_Price__c = pr.List_Price__c - po.Flat_Discount__c;
                    }
                    if(po.Diiscount__c==null && po.Flat_Discount__c==null){
                        pr.Offer_Price__c = pr.List_Price__c;
                    } 
                }
                if(pr.Offer_Available__c==false){
                    pr.Offer_Price__c=pr.List_Price__c;
                }
            }   
        }
    } 
    Public Static void remainingQuantity(List<Product__c> productList3){
        for(Product__c pr : productList3){
            if(pr.Remaining_Quantity__c<=0){
                pr.Active__c=false;
            }
        }
    }
}