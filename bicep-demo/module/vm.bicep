param location string = resourceGroup().location
param subnetId string
param nsgId string
param storageID string

resource networkInterface 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'dev-nic-01'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'dev-ip-01'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetId
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsgId
    }
  }
}

resource ubuntuVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'name'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DC1ds_v3'
    }
    osProfile: {
      computerName: 'computerName'
      adminUsername: 'azureuser'
      adminPassword: 'azureuser@2580'
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        name: 'name'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: storageID
      }
    }
  }
}
output vmId string = ubuntuVM.id
