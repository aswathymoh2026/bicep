param location string = resourceGroup().location
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'devazst1'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
output storageID string = storageaccount.properties.primaryEndpoints.blob
