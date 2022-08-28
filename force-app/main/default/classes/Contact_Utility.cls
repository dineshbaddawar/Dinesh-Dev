public with sharing class Contact_Utility {
    
    public Static void DuplicateContact(List<Contact> conList){
        List<Contact> conListToInsert = new List<Contact>();
        for(Contact con : conList){
            Contact con1 = new Contact();
            con1.LastName = 'Duplicate Contact';
            conListToInsert.add(con1);
        }
        insert conListToInsert;
    }
}