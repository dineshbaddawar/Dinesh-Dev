import { LightningElement } from "lwc";
import { loadScript } from "lightning/platformResourceLoader";
import excelFileReader from "@salesforce/resourceUrl/ExcelReaderPlugin";
let XLS = {};
import insertAccounts from '@salesforce/apex/LwcUtilityHelper.insertAccounts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import LightningConfirm from "lightning/confirm";
export default class ExcelFileReader extends LightningElement {
     error;
     data;
     jsonData = [];
     showTable= false;
     showUploadFile = true;
    /*Accepted formats for the excel file*/
    strAcceptedFormats = [".xls", ".xlsx"];
    strUploadFileName; //Store the name of the selected file.
    objExcelToJSON; //Javascript object to store the content of the file
    connectedCallback() {
        debugger;
        Promise.all([loadScript(this, excelFileReader)])
            .then(() => {
                XLS = XLSX;
            })
            .catch((error) => {
                console.log("An error occurred while processing the file");
            });
    }

    handleUploadFinished(event) {
        debugger;
        const strUploadedFile = event.detail.files;
        if (strUploadedFile.length && strUploadedFile != "") {
            this.strUploadFileName = strUploadedFile[0].name;
            this.handleProcessExcelFile(strUploadedFile[0]);
        }
    }

    handleProcessExcelFile(file) {
        debugger;
        let objFileReader = new FileReader();
        objFileReader.onload = (event) => {
            let objFiledata = event.target.result;
            let objFileWorkbook = XLS.read(objFiledata, {
                type: "binary"
            });
            this.objExcelToJSON = XLS.utils.sheet_to_row_object_array(
                objFileWorkbook.Sheets["Sheet1"]
            );
            //Verify if the file content is not blank
            if (this.objExcelToJSON.length === 0) {
                this.strUploadFileName = "";
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: "Error",
                        message: "Kindly upload the file with data",
                        variant: "error"
                    })
                );
            }

            if (this.objExcelToJSON.length > 0) {
                //Remove the whitespaces from the javascript object
                Object.keys(this.objExcelToJSON).forEach((key) => {
                    const replacedKey = key.trim().toUpperCase().replace(/ss+/g, "_");
                    if (key !== replacedKey) {
                        this.objExcelToJSON[replacedKey] = this.objExcelToJSON[key];
                        delete this.objExcelToJSON[key];
                    }
                });
                debugger;
                console.log('objExcelToJSON'+this.objExcelToJSON);
 
                 let data = JSON.parse(JSON.stringify(this.objExcelToJSON));
                 let objList = [];
                 let index= 0;
                 for(var i=0;i<data.length;i++){
                     index +=1;
                        var obj = {
                          "Name" : data[i]["Name"],
                          "AnnualRevenue" :data[i]["Annual Revenue"],
                          "Phone" : data[i]["Phone"],
                          "Description" : data[i]["Description"],
                          "sno" : index
                      };
                     objList.push(obj);
                  }
                 console.log('data == '+objList);   
                this.jsonData = objList;
                this.showTable = true;
                this.showUploadFile = false;
               // this.callInsertAccountRecords();
            }
        };

        objFileReader.onerror = function (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: "Error while reading the file",
                    message: error.message,
                    variant: "error"
                })
            );
        };
        objFileReader.readAsBinaryString(file);
    }
    
    callInsertAccountRecords(){
        debugger;
        insertAccounts({jsonString : JSON.stringify(this.objExcelToJSON)})
        .then(result =>{
          if(result){
              this.data = result;
              this.handleConfirm();
          }
        })
        .catch(error =>{
            this.error = error;
        })
    }
    HandleImportRecord(){
        debugger;
        this.callInsertAccountRecords();
    }

    showToast() {
    const event = new ShowToastEvent({
        title: 'SUCCESS',
        message: 'Record Imported Successfully!',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(event);
    window.location.href = 'https://dinesh-dev-dev-ed.lightning.force.com/c/colorPickerContainerApp.app';
}

async handleConfirm() {
    const result = await LightningConfirm.open({
      message: "Record Imported Successfully!",
      theme: "success",
      label: "Confirm Header"
    });
     window.location.href = 'https://dinesh-dev-dev-ed.lightning.force.com/c/colorPickerContainerApp.app';
   // console.log("🚀 ~ result", result);
  }

closeAction(){
    debugger;
    window.location.href = 'https://dinesh-dev-dev-ed.lightning.force.com/c/colorPickerContainerApp.app';
}
}