import { LightningElement, track, wire } from "lwc";
import getAccount from "@salesforce/apex/UtilityClassDev.getAccount";

export default class CustomLookupComp extends LightningElement {
  @track accountName = "";
  @track accountList = [];
  @track accountId;
  @track isshow = false;
  @track messageResult = false;
  @track isShowResult = true;
  @track showSearchedValues = false;

  @wire(getAccount, { actName: "$accountName" })
  retrieveAccounts({ error, data }) {
    this.messageResult = false;
    if (data) {
      debugger;
      console.log("data == >" + data.length);
      if (data.length > 0 && this.isShowResult) {
        this.accountList = data;
        this.showSearchedValues = true;
        this.messageResult = false;
      } else if (data.length == 0) {
        this.accountList = [];
        this.showSearchedValues = false;
        if (this.accountName != "") this.messageResult = true;
      }
    } else if (error) {
      debugger;
      this.accountId = "";
      this.accountName = "";
      this.accountList = [];
      this.showSearchedValues = false;
      this.messageResult = true;
    }
  }
  handleClick(event) {
    debugger;
    this.isShowResult = true;
    this.messageResult = false;
  }
  handleKeyChange(event) {
    debugger;
    this.messageResult = false;
    this.accountName = event.target.value;
  }
  handleParentSelection(event) {
    debugger;
    this.showSearchedValues = false;
    this.isShowResult = false;
    this.messageResult = false;
    //Set the parent calendar id
    this.accountId = event.target.dataset.value;
    //Set the parent calendar label
    this.accountName = event.target.dataset.label;
    console.log("accountId == >" + this.accountId);
    const selectedEvent = new CustomEvent("selected", {
      detail: this.accountId,
    });
    // Dispatches the event.
    this.dispatchEvent(selectedEvent);
  }
  handleOpenModal(event) {
    this.isshow = true;
  }
  handleCloseModal(event) {
    this.isshow = false;
  }
  handleSuccess(event) {
    debugger;
    this.isShowResult = false;
    this.messageResult = false;
    this.isshow = false;
    this.accountId = event.detail.id;
    console.log("JSON OBject === >" + JSON.stringify(event.detail));
    this.accountName = event.detail.fields.Name.value;
    const selectedEvent = new CustomEvent("selected", {
      detail: this.accountId,
    });
    this.dispatchEvent(selectedEvent);
  }
  handleReset(event) {
    debugger;
    const inputFields = this.template.querySelectorAll("lightning-input-field");
    if (inputFields) {
      inputFields.forEach((field) => {
        field.reset();
      });
    }
    this.isshow = false;
  }
}