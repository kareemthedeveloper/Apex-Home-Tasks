import { LightningElement, track } from 'lwc';
//import getLastSyncDetails from '@salesforce/apex/WeatherWidgetController.getLastSyncDetails';
//import refreshWeather from '@salesforce/apex/WeatherWidgetController.refreshWeather';
export default class WeatherWidget extends LightningElement {
    /*
    @track configRec;
    @track displayCity;
    @track temperature;
    @track weatherDesc;
    @track weatherIcon;
    @track timestamp;
    @track isFormEnabled;
    @track error;

    connectedCallback(){
        this.getLastSync();
    }

    getLastSync(){
        this.error = '';
        getLastSyncDetails()
        .then(result => {
            this.configRec = result;
            this.populateValues();
        })
        .catch(error => {            
            this.error = error;
        });
    }

    handleRefresh(){
        var cityVal = this.displayCity;
        this.error = '';
        refreshWeather({
            city : cityVal,
            apiKey : apiKeyVal 
        })
        .then(result => {
            this.configRec = result;
            this.populateValues();
        })
        .catch(error => {            
            this.error = error;
        });
    }

    populateValues(){
        var config = this.configRec;
        this.isFormEnabled = false;
        if(config === undefined || config.City__c === ''){
            this.isFormEnabled = true;
        }
        else{
            this.displayCity = config.City__c;
            this.temperature = config.Temperature__c;
            this.weatherDesc = config.Weather__c;
            this.apiKey = config.API_Key__c;
            this.timestamp = config.Last_Synced_on__c;
            this.weatherIcon = 'http://openweathermap.org/img/wn/' + config.Icon_Name__c +'@2x.png';
        }
    }

    updateValue(event){
        var elem = event.target.name;
        var val = event.target.value;
        if(elem === 'inputCity'){
            this.displayCity = val;
        }
        if(elem === 'inputApiKey'){
            if(val !== ''){
                this.apiKey = val;
            }
        }
    }

    handleFormSave(){
        this.handleRefresh();
    }

    handleEdit(){
        this.isFormEnabled = true;
    }

    handleCancel(){
        this.isFormEnabled = false;
    }
    */
}