# Deploying Bitcoin and Datum Together

This example shows how to deploy both Bitcoin and Datum charts together to replicate the original functionality.

## 1. Deploy Bitcoin Chart

```bash
helm install bitcoin ./charts/bitcoin \
  --set global.network=mainnet \
  --set persistence.size=900Gi
```

## 2. Deploy Datum Chart

```bash
helm install datum ./charts/datum \
  --set bitcoin.rpcHost="bitcoin:8332" \
  --set bitcoin.rpcPasswordSecret.name="bitcoin-rpcpassword" \
  --set mining.address="your-bitcoin-address" \
  --set mining.poolHost="datum-beta1.mine.ocean.xyz"
```

## Key Changes in the Integration

### Bitcoin Chart (v2.0.0)
- ✅ Removed Datum sidecar container
- ✅ Removed all Datum configuration from values.yaml
- ✅ Removed Datum ports from Service
- ✅ Removed DATUM_HOST/DATUM_PORT environment variables
- ✅ Updated chart description
- ✅ Now focuses solely on Bitcoin node functionality

### Datum Chart (v1.0.0)
- ✅ Standalone Deployment (not StatefulSet, since Datum is stateless)
- ✅ Connects to Bitcoin via service discovery (`bitcoin:8332`)
- ✅ All original Datum configuration preserved
- ✅ Health checks via API endpoint
- ✅ Proper resource limits and security context

## Benefits of the Integration

1. **Modularity**: Deploy Bitcoin and Datum independently
2. **Flexibility**: Use external Bitcoin nodes with Datum
3. **Scalability**: Scale Datum independently from Bitcoin
4. **Maintainability**: Separate concerns and configurations
5. **Reusability**: Datum chart can be used with any Bitcoin deployment

## Migration from v1.x.x

Users upgrading from the old combined chart should:

1. Deploy the new Bitcoin chart v2.0.0
2. Deploy the new Datum chart v1.0.0 with appropriate configuration
3. Update mining configurations to point to the new services

The integration preserves all functionality while providing better modular deployment.