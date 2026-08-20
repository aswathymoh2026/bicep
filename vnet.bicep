resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'dev-vnet-01'
  location: 'canadacentral'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'dev-vnet-sub-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'dev-vnet-sub-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'dev-vnet-sub-3'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}
