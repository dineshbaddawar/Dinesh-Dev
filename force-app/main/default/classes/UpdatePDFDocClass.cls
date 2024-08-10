public class UpdatePDFDocClass {
    
    public static void updateodcFile(String recordId){
        EmailTemplate emailTempRec = [SELECT Id,Subject,Body,HTMLValue FROM EmailTemplate WHERE Name ='Quotion Invoice'];
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        Quote quoteRec = [SELECT Id,Name,Account.Name,Account.id FROM Quote WHERE Id=:recordId];
        system.debug('quoteRec == >'+quoteRec);
        Contact conRec = [SELECT Id,Name,Email,AccountId from Contact WHERE AccountId=:quoteRec.Account.Id AND Email !=null LIMIT 1];
        system.debug('conRec == >'+conRec);
        PageReference pdfPage = Page.QuoteQutionPDF;
        String subject = emailTempRec.Subject;
        String htmlBody = emailTempRec.HtmlValue;
        htmlBody = htmlBody.replace('{!Account.Name}', quoteRec.Account.Name);    
        pdfPage.getParameters().put('id',recordId);
        Blob pdfBlob = pdfPage.getContent(); 
        attach.setContentType('application/pdf');
        attach.setFileName('Quote Invoice.pdf');
        attach.setBody(pdfBlob);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject(subject);
        mail.setHtmlBody(htmlBody);
        mail.setToAddresses(new String[]{conRec.Email});
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] {attach});
        mailList.add(mail);
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList);
            system.debug('Email Send Successfully');
        }
    }
}