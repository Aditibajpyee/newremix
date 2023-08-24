// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmProduct {
    struct Product {
        uint256 productId;
        string productDescription;
        string producerName;
        string producerAddress;
        uint256 harvestDate;
        string distributorName;
        string distributorAddress;
        uint256 prodToDistDate;
        string retailerName;
        string retailerAddress;
        uint256 distToRetaDate;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount;

    event ProductAdded(uint256 productId);

    
    function addProduct(
        uint256 _productId,
        string memory _productDescription,
        string memory _producerName,
        string memory _producerAddress,
        uint256 _harvestDate
    ) public {
        require(products[_productId].productId == 0, "Product with this ID already exists");
        
        Product storage newProduct = products[_productId];
        newProduct.productId = _productId;
        newProduct.productDescription = _productDescription;
        newProduct.producerName = _producerName;
        newProduct.producerAddress = _producerAddress;
        newProduct.harvestDate = _harvestDate;
        
        productCount++;
        emit ProductAdded(_productId);
    }

  
    function transferToDistributor(
        uint256 _productId,
        string memory _distributorName,
        string memory _distributorAddress,
        uint256 _transferDate
    ) public {
        require(products[_productId].productId != 0, "Product with this ID does not exist");
        
        Product storage product = products[_productId];
        product.distributorName = _distributorName;
        product.distributorAddress = _distributorAddress;
        product.prodToDistDate = _transferDate;
    }

    function transferToRetailer(
        uint256 _productId,
        string memory _retailerName,
        string memory _retailerAddress,
        uint256 _transferDate
    ) public {
        require(products[_productId].productId != 0, "Product with this ID does not exist");
        
        Product storage product = products[_productId];
        product.retailerName = _retailerName;
        product.retailerAddress = _retailerAddress;
        product.distToRetaDate = _transferDate;
    }

   
    function viewAssetDetails(uint256 _productId) public view returns (Product memory) {
        require(products[_productId].productId != 0, "Product with this ID does not exist");
        return products[_productId];
    }
}
