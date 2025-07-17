# Deploying Bitcoin and Datum Together

This example shows how to deploy both Bitcoin and Datum charts together.

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
  --set mining.address="your bitcoin wallet address" \
  --set mining.poolHost="datum-beta1.mine.ocean.xyz"  # or set to empty "" for solo-mining
```

## Benefits of the Integration

1. **Modularity**: Deploy Bitcoin and Datum independently
2. **Flexibility**: Use external Bitcoin nodes with Datum
3. **Scalability**: Scale Datum independently from Bitcoin
4. **Maintainability**: Separate concerns and configurations
5. **Reusability**: Datum chart can be used with any Bitcoin deployment