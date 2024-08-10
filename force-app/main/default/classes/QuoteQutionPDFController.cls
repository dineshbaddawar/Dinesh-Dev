/**
 * @author Dinesh B
 * @email dinesh.b@utilitarianlab.com
 * @create date 2023-09-23 21:37:51
 * @modify date 2023-09-23 21:37:51
 * @desc [Class for Creating Creating PDF]  
 */

public class QuoteQutionPDFController {
     public id QuoteID {get;set;}
    public List<QuoteLineItem> quoteLines {get;set;}
    public Quote billInfoForQuote {get;set;}
    public QuoteDocument quoteDoc {get;set;}
    public Quote TermsCond {get;set;}
    public boolean qliDiscount {get;set;}
    public aggregateResult TotalQty {get;set;}
    public Object qty {get;set;}
    public Boolean showTaxColoumn {get;set;}
    public String quoteVersion {get;set;}
    public string CreatedDate {get;set;}
    public string NoToWord {get;set;}  
    public Double totalAmount {get;set;}
    public Double TotalTax {get;set;}
    public QuoteQutionPDFController(ApexPages.StandardController controller){
        this.totalAmount=0;
        string id= ApexPages.currentPage().getParameters().get('id');
        System.debug(id);
        if(id!=null){
            this.QuoteID=id;
            this.getQuoteLineItems();
            DateTime todaysDate = System.today();
            CreatedDate = todaysDate.format('dd-MM-yyyy');
            System.debug(CreatedDate);
        }
    }
    public void getQuoteLineItems(){
        this.showTaxColoumn = false;
        this.quoteLines=[Select Id,Product2Id,Product2.Name,Product2.ProductCode,TotalPrice,unitPrice,Quantity,Discount,Description__c,Discount__c,Product_Name_Not_Required__c,Amount_to_be_Paid__c from QuoteLineItem where QuoteId=:this.QuoteID order by CreatedDate asc];
        if(!this.quoteLines.isEmpty()){
            for(QuoteLineItem qli : this.quoteLines){
                if(qli.Discount__c != null && qli.Discount__c > 0){
                    qliDiscount = true;
                }
            }
        }

        this.billInfoForQuote=[select BillingStreet,BillingState,BillingPostalCode,BillingCountry,BillingCity,QuoteNumber,GrandTotal,Subtotal,TotalPrice,Discount__c,Amount_to_be_paid__c,
                               Name,Product_Total_Amount__c, Account.Name,Account.BillingStreet,Account.BillingCity,Account.BillingState,
                               Contact.Name,Contact.Email,Contact.Salutation,Account.ShippingCity, Account.ShippingStreet,Account.ShippingState,Account.ShippingCountry,
                               Owner.Name,Owner.Email,Owner.PHone from Quote where Id=:this.QuoteID LIMIT 1];
               List<QuoteDocument> quoteDoc=[select Id,Name,ContentVersionDocumentId,Document,CreatedDate  from QuoteDocument where QuoteId=:this.QuoteID  order by CreatedDate desc];
        if(quoteDoc.size() >= 1){
            this.quoteDoc=quoteDoc[0];
            this.quoteVersion='|'+(quoteDoc.size()+1)+'';
        }
        else{
            this.quoteVersion='';
        }
        if(this.TotalQty!=null){
            this.qty=this.TotalQty.get('qty');
        }
        Integer data = 35000 ; 
        System.debug('data ==== >'+data);
    }
    
    @AuraEnabled
    public static string downloadPDFQuote(String quoteId){
        system.debug('RecordId == >'+quoteId);
        try {
            List<Attachment> attachmentList = new List<Attachment>();
           // Blob certificatePdf = ApexPages.currentPage().getContent();
           // system.debug('certificatePdf data ==== >'+certificatePdf);
            PageReference pageRef = page.QuoteQutionPDF;
            pageRef.getParameters().put('id',quoteId);
            blob vBody;
            vBody=pageRef.getContent();
            system.debug('Blob data ==== >'+vBody);
            if(vBody !=null){
                ProtectPDFDocument var = new ProtectPDFDocument();
                var.startProcessing(vBody,quoteId);
                return 'Success';
            }
            // Integer currentMonth;
            // vBody=pageRef.getContent();
            // Attachment attach = new Attachment();
            // attach.Body = vBody;
            // currentMonth = System.now().month();
            // String MonthName = (currentMonth == 9) ? 'September' : 'value2';
            // attach.Name = 'Quote'+'_'+currentMonth+System.now()+'.pdf';
            // attach.ParentId = recordId;
            // attach.ContentType = 'application/pdf';
            // attachmentList.add(attach);
            // if(!attachmentList.isEmpty()){
            //     insert attachmentList;
            //     system.debug('attachmentList ID==>' +attachmentList[0].Id);
            // }
            
        } catch (Exception e) {
            System.debug('The Error ::'+e.getMessage() +' AND Error Line No :'+e.getLineNumber());
        }
        return null;
    }
    
}