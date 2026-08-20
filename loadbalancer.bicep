resource loadBalancerExternal 'Microsoft.Network/loadBalancers@2020-11-01' = {
  name: 'name'
  location: 'canadacentral'
  properties: {
    frontendIPConfigurations: [
      {
        name: 'name'
        properties: {
          publicIPAddress: {
            id: 'publicIPAddresses.id'
          }
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'name'
      }
    ]
    inboundNatRules: [
      {
        name: 'name'
        properties: {
          frontendIPConfiguration: {
            id: 'frontendIPConfiguration.id'
          }
          protocol: 'Tcp'
          frontendPort: 50001
          backendPort: 3389
          enableFloatingIP: false
        }
      }
    ]
    loadBalancingRules: [
      {
        name: 'name'
        properties: {
          frontendIPConfiguration: {
            id: 'frontendIPConfiguration.id'
          }
          backendAddressPool: {
            id: 'backendAddressPool.id'
          }
          protocol: 'Tcp'
          frontendPort: 80
          backendPort: 80
          enableFloatingIP: false
          idleTimeoutInMinutes: 5
          probe: {
            id: 'probe.id'
          }
        }
      }
    ]
    probes: [
      {
        name: 'name'
        properties: {
          protocol: 'Tcp'
          port: 80
          intervalInSeconds: 5
          numberOfProbes: 2
        }
      }
    ]
  }
}
