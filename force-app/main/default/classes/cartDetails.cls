public class cartDetails {
	@AuraEnabled(Cacheable=true)
    public static List<Cart1__c> fetchCartDetails(){
        List<Cart1__c> lstCart = [Select Id, Name from Cart1__c];
        return lstCart;
    }
}