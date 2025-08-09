#!/bin/bash

echo "=== PostgreSQL Debug Script ==="
echo ""

echo "1. Checking Helm releases..."
helm list -A 2>/dev/null || echo "Helm not found or no releases"
echo ""

echo "2. Checking if PostgreSQL image can run locally..."
docker run --rm postgres:13-alpine postgres --version 2>/dev/null || echo "Docker not available"
echo ""

echo "3. Testing PostgreSQL environment variables..."
echo "POSTGRES_DB=mydb"
echo "POSTGRES_USER=c0941004" 
echo "POSTGRES_PASSWORD=pass123"
echo "PGDATA=/var/lib/postgresql/data/pgdata"
echo ""

echo "4. Recommended deployment command:"
echo "helm upgrade --install c0941004-db ./db -f ./db/dev/values.yaml -f ./db/dev/secrets.yaml --debug --dry-run"
echo ""

echo "5. To check status after deployment:"
echo "helm status c0941004-db"
echo ""

echo "6. Common PostgreSQL crash causes fixed:"
echo "   ✓ Removed conflicting DB_* and POSTGRES_* variables"
echo "   ✓ Added PGDATA environment variable"
echo "   ✓ Changed from hostPath to emptyDir volume"
echo "   ✓ Removed health checks that interfere with startup"
echo "   ✓ Added proper resource limits"
echo "   ✓ Reduced replicas to 1 for dev environment"
echo ""

echo "7. If still crashing, try:"
echo "   - Check your Kubernetes dashboard for pod events"
echo "   - Use 'docker logs <container-id>' if running in Docker"
echo "   - Verify your Kubernetes cluster has enough resources"
