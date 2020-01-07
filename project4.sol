pragma solidity >=0.4.22 <0.6.0;

contract Project4{
    address owner;
    address[] accounts;
    address[] accountsFarmer;
    address[] accountsGov;
    address[] accountsThird;
    address[] accountsConsumer;
    address[] accountsDelivery;
    uint NumOfAccounts;
    uint NumOfAccountsFarmer;
    uint NumOfAccountsGov;
    uint NumOfAccountsThird;
    uint NumOfAccountsConsumer;
    uint NumOfAccountsDelivery;
    uint NumOfResume;
    uint NumOfGovCheckedResume;
    uint NumOfThirdCheckedResume;
    mapping(address => uint256) accountid;
    mapping(address => uint256[]) famrerownresume;
    
    constructor()public payable{
        owner=msg.sender;
    }

    struct Resume{
        uint resumeID;
        address payable resumeowner;
        string resumeproduct;
    }
    
    struct CheckedResume{
        uint resumeID;
        uint originresumeID;
        address resumeowner;
        string resumeproduct;
    }
    
    Resume[] Resumes;
    Resume[] RecheckResumes;
    CheckedResume[] GovCheckedResumes;
    CheckedResume[] ThirdCheckedResumes;
    
    struct SaleList{
        uint quantity;
        uint price;
        Resume resume;
    }
    
    SaleList[] SaleLists;
    
    struct BuyList{
        address buyer;
        uint quantity;
        uint price;
        Resume resume;
    }
    
    BuyList[] BuyLists;
    
    struct DeliveryList{
        Resume resume;
        string fromwho;
        address payable who;
        bool complete;
        string destination;
    }
    
    DeliveryList[] DeliveryLists;
    DeliveryList[] CanDeliveryLists;
    
    modifier OnlyOwner(){
        require(msg.sender==owner,"Admin only!");
        _;
    }
    
    modifier OnlyFarmer(){
        if (accountsFarmer.length==0){
            require(msg.sender==owner,"Farmer only!");
        }
        else    
        {
            for(uint i=0; i<accountsFarmer.length;i++){
                require(msg.sender==accountsFarmer[i] || msg.sender==owner,"Farmer only!"); 
            }
        }
        _;
    }
 
    modifier OnlyGov(){
        if (accountsGov.length==0){
            require(msg.sender==owner,"Government only!");
        }
        else    
        {
            for(uint i=0; i<accountsGov.length;i++){
                require(msg.sender==accountsGov[i] || msg.sender==owner,"Government only!"); 
            }
        }
        _;
    }
    
    modifier OnlyThird(){
        if (accountsThird.length==0){
            require(msg.sender==owner,"Third party only!");
        }
        else    
        {
            for(uint i=0; i<accountsThird.length;i++){
                require(msg.sender==accountsThird[i] || msg.sender==owner,"Third party only!"); 
            }
        }
        _;
    }
    
    modifier OnlyConsumer(){
        if (accountsConsumer.length==0){
            require(msg.sender==owner,"Consumer only!");
        }
        else    
        {
            for(uint i=0; i<accountsConsumer.length;i++){
                require(msg.sender==accountsConsumer[i] || msg.sender==owner,"Consumer only!"); 
            }
        }
        _;
    }

    modifier OnlyDelivery(){
        if (accountsDelivery.length==0){
            require(msg.sender==owner,"Home Delivery only!");
        }
        else    
        {
            for(uint i=0; i<accountsDelivery.length;i++){
                require(msg.sender==accountsDelivery[i] || msg.sender==owner,"Home Delivery only!"); 
            }
        }
        _;
    }
    
    function _AddFarmer(address _accountAddress) OnlyOwner public{
        for (uint i=0; i<accounts.length;i++){
            require(accounts[i]!=_accountAddress,"Repaet account!");
        }
        uint id = accountid[_accountAddress];
        uint idT;
        if (id == 0) {
            accountid[_accountAddress] = accounts.length;
            id = accounts.length++;
            idT = accountsFarmer.length++;
        }
        accounts[id] = _accountAddress;
        NumOfAccounts++;
        accountsFarmer[idT] = _accountAddress;
        NumOfAccountsFarmer++;
    }
    
    function _AddGov(address _accountAddress) OnlyOwner public{
        for (uint i=0; i<accounts.length;i++){
            require(accounts[i]!=_accountAddress,"Repaet account!");
        }
        uint id = accountid[_accountAddress];
        uint idT;
        if (id == 0) {
            accountid[_accountAddress] = accounts.length;
            id = accounts.length++;
            idT = accountsGov.length++;
        }
        accounts[id] = _accountAddress;
        NumOfAccounts++;
        accountsGov[idT] = _accountAddress;
        NumOfAccountsGov++;
    }
    
    function _AddThird(address _accountAddress) OnlyOwner public{
        for (uint i=0; i<accounts.length;i++){
            require(accounts[i]!=_accountAddress,"Repaet account!");
        }
        uint id = accountid[_accountAddress];
        uint idT;
        if (id == 0) {
            accountid[_accountAddress] = accounts.length;
            id = accounts.length++;
            idT = accountsThird.length++;
        }
        accounts[id] = _accountAddress;
        NumOfAccounts++;
        accountsThird[idT] = _accountAddress;
        NumOfAccountsThird++;
    }
    
    function _AddConsumer(address _accountAddress) OnlyOwner public{
        for (uint i=0; i<accounts.length;i++){
            require(accounts[i]!=_accountAddress,"Repaet account!");
        }
        uint id = accountid[_accountAddress];
        uint idT;
        if (id == 0) {
            accountid[_accountAddress] = accounts.length;
            id = accounts.length++;
            idT = accountsConsumer.length++;
        }
        accounts[id] = _accountAddress;
        NumOfAccounts++;
        accountsConsumer[idT] = _accountAddress;
        NumOfAccountsConsumer++;
    }
    
    function _AddDelivery(address _accountAddress) OnlyOwner public{
        for (uint i=0; i<accounts.length;i++){
            require(accounts[i]!=_accountAddress,"Repaet account!");
        }
        uint id = accountid[_accountAddress];
        uint idT;
        if (id == 0) {
            accountid[_accountAddress] = accounts.length;
            id = accounts.length++;
            idT = accountsDelivery.length++;
        }
        accounts[id] = _accountAddress;
        NumOfAccounts++;
        accountsDelivery[idT] = _accountAddress;
        NumOfAccountsDelivery++;
    }
    
    function FarmerNewResume(string memory _product, string memory _gov) OnlyFarmer public{
        NumOfResume++;
        Resumes.push(Resume(NumOfResume, msg.sender, _product));
        famrerownresume[msg.sender].push(NumOfResume);
        DeliveryLists.push(DeliveryList(Resumes[NumOfResume],'Farmer', msg.sender, false, _gov));
    }
    
    function FarmerNewSale(uint _quantity, uint _price, uint _resumeid) OnlyFarmer public{
        uint ok = 0;
        for (uint i=0; i<famrerownresume[msg.sender].length; i++){//檢查是否有經過政府、第三方認證
            for (uint j=0; j<ThirdCheckedResumes.length; j++){
                if (ThirdCheckedResumes[j].originresumeID == famrerownresume[msg.sender][i]){
                    uint resumeidtemp = famrerownresume[msg.sender][i];
                    SaleLists.push(SaleList(_quantity, _price, Resumes[resumeidtemp]));
                    ok = 1;
                }
                if(ok == 1){
                    break;
                }
            }
            if(ok == 1){
                break;
            }
        }
    }
    
    function GovCheckResume() OnlyGov public{
        for (uint i=0; i<Resumes.length;i++){
            if(NumOfGovCheckedResume==0){//政府檢測，通過才新增到GovCheckedResumes
                NumOfGovCheckedResume++;
                GovCheckedResumes.push(CheckedResume(NumOfGovCheckedResume, Resumes[i].resumeID, Resumes[i].resumeowner, Resumes[i].resumeproduct));
            }
        }
    }
    
    function GovFine() OnlyGov public{
        for (uint i=0; i<RecheckResumes.length;i++){
            if(NumOfGovCheckedResume==0){//政府重新檢測，沒通過就罰農夫錢
                RecheckResumes[i].resumeowner.transfer(500);
            }
        }
    }
    
    function ThirdCheckResume() OnlyThird public{
        for (uint i=0; i<GovCheckedResumes.length;i++){
            if(NumOfThirdCheckedResume==0){//第三方檢測，通過才新增到ThirdCheckedResumes
                NumOfThirdCheckedResume++;
                ThirdCheckedResumes.push(CheckedResume(NumOfThirdCheckedResume, GovCheckedResumes[i].originresumeID, GovCheckedResumes[i].resumeowner, GovCheckedResumes[i].resumeproduct));
            }
        }
    }
    
    function CosumerBuyProduct(string memory _product, uint _quantity, uint _price, string memory _home) OnlyConsumer public{
        for(uint i = 0; i < SaleLists.length; i++){
            bool notequal = true;
            if (bytes(_product).length != bytes(SaleLists[i].resume.resumeproduct).length){
                continue;
            }
            else{
                for(uint j = 0; j < bytes(SaleLists[i].resume.resumeproduct).length; j++){
                    if (bytes(_product)[j] != bytes(SaleLists[i].resume.resumeproduct)[j]){
                        notequal = false;
                        break;
                    }
                }
            }
            if (notequal == false){
                continue;
            }
            if(SaleLists[i].quantity >= _quantity && SaleLists[i].price <= _price){
                SaleLists[i].quantity -= _quantity;
                if(SaleLists[i].quantity == 0){
                    delete SaleLists[i];
                    SaleLists.length--;
                }
                BuyLists.push(BuyList(msg.sender, _quantity, _price, SaleLists[i].resume));
                DeliveryLists.push(DeliveryList(SaleLists[i].resume,'Consumer', msg.sender, false, _home));
                break;
            }
        }
    }
    
    function CosumerRecheck(uint _resumeid, string memory _gov) OnlyConsumer public{
        RecheckResumes.push(Resume(Resumes[_resumeid].resumeID, Resumes[_resumeid].resumeowner, Resumes[_resumeid].resumeproduct));
        DeliveryLists.push(DeliveryList(Resumes[_resumeid], 'Consumer', msg.sender, false, _gov));
    }
    
    function DeliverProduct(string memory _city, string memory _dict) OnlyDelivery public{
        
        for(uint i = 0; i < DeliveryLists.length; i++){
            bool notequal = true;
            for(uint j = 0; j < 3; j++){
                if(bytes(DeliveryLists[i].destination)[j] != bytes(_city)[j]){
                    notequal = false;
                    break;
                }
            }
            for(uint j = 3; j < 6; j++){
                if(bytes(DeliveryLists[i].destination)[j] != bytes(_dict)[j - 3]){
                    notequal = false;
                    break;
                }
            }
            if(notequal==false){
                continue;
            }
            CanDeliveryLists.push(DeliveryLists[i]);
        }
    }
    
    function DeliverFailed(uint _id) OnlyDelivery public{
        CanDeliveryLists[_id].who.transfer(500);
    }
    
}
