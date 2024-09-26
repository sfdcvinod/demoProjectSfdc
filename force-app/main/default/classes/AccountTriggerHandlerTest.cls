@isTest
Private class AccountTriggerHandlerTest 
{
 Static testmethod void test_MakeMandatoryField()
 {
     AccountTriggerHandler.MakeMandatoryField(new List<Account>());
     Account acc = new Account();
     acc.Name = 'Sample';
     acc.phone = '1122334455';
     acc.Fax = '';
     acc.Website = '';
     acc.Industry = '';
     insert acc;
 }
    
    
}