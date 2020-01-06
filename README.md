# Project2-4_Smart_contract

## 角色
農夫

政府

第三方組織

消費者

宅配

## 功能

![](https://github.com/cislab-yzu/Project2-4_Smart_contract/blob/master/pictures/1.jpg)

### 發布者

`_AddFarmer(address _accountAddress)`:新增農夫address

`_AddGov(address _accountAddress)`:新增政府address

`_AddThird(address _accountAddress)`:新增第三方組織address

`_AddConsumer(address _accountAddress)`:新增消費者address

`_AddDelivery(address _accountAddress)`:新增宅配address

### 農夫

`FarmerNewResume(string memory _product)`:農夫新增要送檢驗的產品(產品名稱)，會新增到宅配清單。

`FarmerNewSale(uint _resumeid, uint _quantity, uint _price)`:農夫新增賣單(履歷ID，數量，價格)，會檢查要有政府、第三方組織認證的履歷，產品也要對。

### 政府

`GovCheckResume`:取得並檢驗未檢驗的產品，通過之後第三方才能檢驗政府檢驗過的產品。

### 第三方組織

`ThirdCheckResume`:取得並檢驗未檢驗的產品，通過之後農夫才能賣政府、第三方組織檢驗過的產品。

### 消費者

`CosumerBuyProduct(string memory _product, uint _quantity, uint _price, string memory _home)`:消費者下單(產品名稱，數量，價格，地址)，會新增到宅配清單。

`CosumerRecheck(uint _resumeid)`:消費者重新送檢驗(履歷ID)，會新增到宅配清單。

### 宅配

`DeliverProduct(string memory _city, string memory _dict)`:取得宅配清單(縣市，區)，會以區分配清單給宅配業者。

## 工作分配
###  1051524莊子毅 25%
###  1051433葛東昇 25%
###  1051518李政憲 25%
###  1051434蔡適謙 25%
