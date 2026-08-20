param location string = resourceGroup().location

module vnetModule './module/vnet.bicep' = {
  name: 'vnetModule'
  params: {
    location: location
  }
}

module nsgModule './module/nsg.bicep' = {
  name: 'nsgModule'
  params: {
    location: location
  }
}

module storageModule './module/storage.bicep' = {
  name: 'storageModule'
  params: {
    location: location
  }
}

module vmModule './module/vm.bicep' = {
  name: 'vmModule'
  params: {
    storageID: storageModule.outputs.storageID
    location: location
    subnetId: vnetModule.outputs.subnetId
    nsgId: nsgModule.outputs.nsgId
  }
}
output vnetID string = vnetModule.outputs.vnetID
output storageID string = storageModule.outputs.storageID
output nsgID string = nsgModule.outputs.nsgId
