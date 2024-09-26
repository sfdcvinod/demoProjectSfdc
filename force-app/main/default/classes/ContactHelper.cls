public class ContactHelper 
{
    public static void CreateNewContact()
    {
        Contact con = new Contact();
        con.FirstName = 'Janu';
        con.LastName = 'Contact Record';
        con.Title = 'Project Manager';
        con.Email = 'sample@gmail.com';
        con.Phone = '9900112244';
        con.Fax = '9900112244';
        con.LeadSource = 'Web';
        con.MailingCity = 'Hyderabad';
        con.MailingState = 'Telangana';
        con.MailingCountry = 'India';
        insert con;
        if (con.Id !=null)
        {
            system.debug('Contact Record Craeted with ID = '+con.Id);
  
        }
        
       
        
    }
     
     
}