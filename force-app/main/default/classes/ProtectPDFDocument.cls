public class ProtectPDFDocument {
    
    public void startProcessing(Blob SourceFile){
        String API_KEY = 'componentaura@gmail.com_a89abda3f847a67c83bd0ba061bbac60a917641ba5b0095253d9b6e5d7f01499d03829eb';
        String fileName = 'PFD File'; // File name "sample.pdf" which is available in Files.
        string DestinationFile =  'PasswordPDF.pdf'; //This is the Desitantion File Name.
        // Passwords to protect PDF document
        // The owner password will be required for document modification.
        // The user password only allows to view and print the document.
        string OwnerPassword = '123456';
        string UserPassword = '654321';
        // Encryption algorithm. 
        // Valid values: 'RC4_40bit', 'RC4_128bit', 'AES_128bit', 'AES_256bit'.
        string EncryptionAlgorithm = 'AES_128bit';
        try{
            //1. Prepare URL for "Get Presigned URL" API call
            string url = 'https://api.pdf.co/v1/file/upload/get-presigned-url?contenttype=application/octet-stream&name=:fileName'; 
            HttpRequest req = new HttpRequest();
            req.setHeader('x-api-key', API_KEY);
            req.setEndpoint(url);
            req.setMethod('GET');
            req.setTimeout(60000);
            Http http = new Http();
            HTTPResponse res = http.send(req);
            if(res.getStatusCode() == 200) {
                System.Debug('res ====> 1 ' + res);
                Map<String, Object> deserializedBody =  (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
                Boolean isError = Boolean.ValueOf(deserializedBody.get('error'));
                if(isError == false){
                    // Get URL to use for the file upload
                    String uploadUrl = String.ValueOf(deserializedBody.get('presignedUrl'));
                    // Get URL of uploaded file to use with later API calls
                    String uploadedFileUrl = String.ValueOf(deserializedBody.get('url'));
                    // 2. UPLOAD THE FILE TO CLOUD.
                    if(uploadFile(API_KEY, uploadUrl, SourceFile)){
                        // 3. Add Password to Uploaded file and download.
                        AddProtectionToInputPDF(API_KEY, DestinationFile, uploadedFileUrl, OwnerPassword, UserPassword, EncryptionAlgorithm);
                    }
                }
            }
            else{
                System.debug('Error Response ===> 1 ' + res.getBody());
                System.Debug(' Status ===> 1 ' + res.getStatus());
                System.Debug(' Status Code ===> 1' + res.getStatusCode());
                System.Debug(' Response String ====> 1' + res.toString());
            }
        }catch(Exception ex){
            String errorBody = 'Message ====>1  : ' + ex.getMessage() + ' && Cause ====>1 : ' + ex.getCause() + ' && Stacktrace ===>1 : ' + ex.getStackTraceString();
            System.Debug('errorBody==== 1 >'+errorBody);
        }
    }
    
    @TestVisible
    public static boolean uploadFile(String API_KEY, String url, Blob sourceFile){
        HttpRequest req = new HttpRequest();
        req.setHeader('x-api-key', API_KEY);
        req.setHeader('Content-Type', 'application/octet-stream');
        req.setEndpoint(url);
        req.setMethod('PUT');
        req.setTimeout(60000);
        req.setBodyAsBlob(sourceFile);
        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            System.Debug('res =====> 2 :'+ res);
            return true;
        }else{
            System.debug('Error Response  ===> 2 :' + res.getBody());
            System.Debug(' Status ====> 2 :' + res.getStatus());
            System.Debug(' Status Code ===> 2 :' + res.getStatusCode());
            System.Debug(' Response String ===> 2 :' + res.toString());
            return false;
        }
    }
    
    public static void AddProtectionToInputPDF(String API_KEY, String DestinationFile, String uploadedFileUrl, String ownerPassword, String userPassword, String encryptionAlgorithm){
        Map<string, object> parameters = new Map<string, object>();
        parameters.put('name', DestinationFile);
        parameters.put('url', uploadedFileUrl);
        parameters.put('ownerPassword', ownerPassword);
        parameters.put('userPassword', userPassword);
        parameters.put('encryptionAlgorithm', encryptionAlgorithm);
        string jsonPayload = Json.serialize(parameters);
        String url = 'https://api.pdf.co/v1/pdf/security/add';
        
        HttpRequest req = new HttpRequest();
        req.setHeader('x-api-key', API_KEY);
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(url);
        req.setMethod('POST');
        req.setTimeout(60000);
        req.setBody(jsonPayload);
        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200) {
            System.Debug('res ===> 3 :'+res);
            Map<String, Object> deserializedBody =  (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            Boolean isError = Boolean.ValueOf(deserializedBody.get('error'));
            if(isError == false){
                String resultFileUrl = String.ValueOf(deserializedBody.get('url'));
                downloadPDFAndStore(resultFileUrl, DestinationFile);
            }
        }else{
            System.debug('Error Response ===> 3  :' + res.getBody());
            System.Debug(' Status====>3 :' + res.getStatus());
            System.Debug(' Status Code ====> 3 :' + res.getStatusCode());
            System.Debug(' Response String ===> 3 :' + res.toString());
        }
    }
    
    @TestVisible
    private static void downloadPDFAndStore(String extFileUrl, String DestinationFile){
        Http h = new Http(); 
        HttpRequest req = new HttpRequest(); 
        extFileUrl = extFileUrl.replace(' ', '%20'); 
        req.setEndpoint(extFileUrl); 
        req.setMethod('GET'); 
        req.setHeader('Content-Type', 'application/pdf');
        req.setCompressed(true); 
        req.setTimeout(60000); 
        //Now Send HTTP Request
        HttpResponse res  = h.send(req); 
        if(res.getStatusCode() == 200) {
            blob fileContent = res.getBodyAsBlob();      
            Attachment attach = new Attachment();
            attach.Body = fileContent;
            attach.Name = 'Invoice Pdf_password_'+String.valueof(System.now());
            attach.IsPrivate = true;
            attach.ParentId = '0015j00000U4y2eAAB';  
            attach.ContentType = 'application/pdf';
            insert attach;
            System.Debug('Success attach === > 4 :'+attach);
        }else{
            System.debug('Error Response ===> 4 :' + res.getBody());
            System.Debug(' Status ===> 4  :' + res.getStatus());
            System.Debug(' Status Code ===> 4 :' + res.getStatusCode());
            System.Debug(' Response String ===> 4 :' + res.toString());
        }
    }
    
    // For calling above Method
    /*
PageReference pdfPage = Page.AccountPDF;
pdfPage.getParameters().put('id','0015j00000U4y2eAAB');
blob pdfBody;
pdfBody = pdfPage.getContent();

ProtectPDFDocument var = new ProtectPDFDocument();
var.startProcessing(pdfBody);
*/
}