public class CaseTriggerHandler 
{
  Public static void AccountContactMandetory(List<Case> lstCase)
  {
      for(Case cs : lstCase)
      {
          if(cs.AccountId == '' || cs.AccountId ==null)
          {
              cs.AccountId.AddError('Account should required field');
          }
          if(cs.ContactId =='' || cs.ContactId == null)
          {
              cs.ContactId.AddError('Contact should required field');
          }
          
      }
  }
}