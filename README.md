## SMS Store

### This was never tested due to the requirement of a Partner Account on the SimPlay dashboard!

SMS Store was created for Garry's Mod servers and allows server owners to make additional money using Premium SMS from SimPay. SMS Store will give the user a phone number to send an SMS, once the user enters the code provided by SimPay he will then me prompted to enter it in a text box, after that SMS Store verifies the code using SimPay API and depending on the validity will either give the user the package or notify him that the transaction was unsuccessful. 

## Installation 
SMS Store uses [SimPay.pl](https://simpay.pl/) API to process the codes and check their validity, therefore **owning a partner acccount registered in Poland is a requirement.** You also need to create packages on the Premium SMS Panel on SimPay and create your packages of choice in the config using the appropriate IDs provided by SimPay. Additionally, you will have to enter your API details in `lua/sms/server/sv_sms_main.lua` otherwise the API calls will fail. 
