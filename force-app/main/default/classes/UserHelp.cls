public class UserHelp 
{
  public static void UserAllRecords()
  {
      Map<Id, User> mpuser = new Map<Id, User>([SELECT Id, Name, Department, City, State FROM User]);
      system.debug('Total Number of Users='+mpuser.size());
      if(! mpuser.isEmpty())
      {
          for(User us : mpuser.Values())
          {
              system.debug('User ID='+us.Id);
              system.debug('User Name='+us.Name);
              system.debug('User Dapartment='+us.Department);
              system.debug('User City='+us.City);
              system.debug('User State='+us.State);
              system.debug('____________________________________');
          }
      }
  }
}