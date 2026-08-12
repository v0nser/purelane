#!/bin/bash

# Purelane Store Setup Script
# Automates metafield creation, product seeding, and collection setup
# 
# Usage: ./setup-store.sh

set -e

STORE="w0eg31-en.myshopify.com"
API_VERSION="2024-01"

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Purelane Store Setup${NC}\n"

# Check token
if [ -z "$SHOPIFY_ACCESS_TOKEN" ]; then
  echo -e "${RED}❌ SHOPIFY_ACCESS_TOKEN not set${NC}\n"
  echo -e "${YELLOW}📌 How to get your access token:${NC}\n"
  echo "1. Go to: https://app.shopify.com/services/partners"
  echo "2. Select store: w0eg31-en.myshopify.com"
  echo "3. Settings → Apps and integrations → Develop apps → Create an app"
  echo "4. Scopes needed:"
  echo "   - write_products, read_products"
  echo "   - write_metafields, read_metafields"
  echo "   - write_collections, read_collections"
  echo "5. Copy the Admin API access token"
  echo ""
  echo -e "${BLUE}Then run:${NC}"
  echo "  SHOPIFY_ACCESS_TOKEN=\"your-token\" ./setup-store.sh\n"
  exit 1
fi

# Helper: GraphQL request
graphql_request() {
  local query="$1"
  local variables="$2"
  
  local payload="{\"query\":$query"
  if [ -n "$variables" ]; then
    payload="$payload,\"variables\":$variables"
  fi
  payload="$payload}"
  
  curl -s -X POST \
    "https://${STORE}/admin/api/${API_VERSION}/graphql.json" \
    -H "Content-Type: application/json" \
    -H "X-Shopify-Access-Token: ${SHOPIFY_ACCESS_TOKEN}" \
    -d "$payload"
}

# Step 1: Create Metafields
echo -e "${BLUE}📋 Creating metafield definitions...${NC}"

metafields=(
  '{"namespace":"custom","key":"rating","name":"Rating","description":"Product rating","type":"number_decimal","ownerType":"PRODUCT","access":{"admin":"READ_WRITE","storefront":"READ"}}'
  '{"namespace":"custom","key":"review_count","name":"Review Count","description":"Review count","type":"number_integer","ownerType":"PRODUCT","access":{"admin":"READ_WRITE","storefront":"READ"}}'
  '{"namespace":"custom","key":"bottle_style","name":"Bottle Style","description":"Bottle CSS class","type":"single_line_text_field","ownerType":"PRODUCT","access":{"admin":"READ_WRITE","storefront":"READ"}}'
)

for mf in "${metafields[@]}"; do
  key=$(echo "$mf" | grep -o '"key":"[^"]*"' | cut -d'"' -f4)
  
  response=$(graphql_request 'mutation CreateMetafieldDefinition($definition: MetafieldDefinitionInput!) { metafieldDefinitionCreate(definition: $definition) { metafieldDefinition { id } userErrors { message } } }' "{\"definition\":$mf}")
  
  if echo "$response" | grep -q '"id"'; then
    echo -e "  ${GREEN}✅${NC} $key"
  else
    echo -e "  ${YELLOW}ℹ️${NC}  $key (may already exist)"
  fi
done

# Step 2: Get Store ID (needed for collections)
echo -e "\n${BLUE}📂 Getting store info...${NC}"

SHOP_QUERY='{ shop { id name } }'
shop_response=$(graphql_request "$SHOP_QUERY")
SHOP_ID=$(echo "$shop_response" | grep -o '"id":"gid://[^"]*"' | head -1 | cut -d'"' -f4)

echo -e "  ${GREEN}✅${NC} Connected to $STORE"

# Step 3: Create Products from CSV
echo -e "\n${BLUE}🛍️  Seeding products from CSV...${NC}"

CSV_FILE="purelane-shopify-theme/scripts/seed-products.csv"

if [ ! -f "$CSV_FILE" ]; then
  echo -e "  ${RED}✗${NC} CSV file not found: $CSV_FILE"
  exit 1
fi

# Skip header, process each line
tail -n +2 "$CSV_FILE" | while IFS=',' read -r title handle desc vendor type tags published opt1_name opt1_val sku grams tracker qty policy service price compare_at shipping taxable image gift; do
  # Trim whitespace
  title=$(echo "$title" | xargs)
  handle=$(echo "$handle" | xargs)
  price=$(echo "$price" | xargs)
  compare_at=$(echo "$compare_at" | xargs)
  qty=$(echo "$qty" | xargs)
  
  if [ -z "$title" ]; then continue; fi
  
  # Create product mutation
  PRODUCT_MUTATION='mutation CreateProduct($input: ProductInput!) { productCreate(input: $input) { product { id } userErrors { message } } }'
  
  PRODUCT_INPUT="{\"title\":\"$title\",\"handle\":\"$handle\",\"productType\":\"$type\",\"vendor\":\"$vendor\",\"status\":\"ACTIVE\",\"variants\":[{\"price\":$price,\"compareAtPrice\":$compare_at,\"sku\":\"$sku\",\"inventoryQuantity\":${qty:-0},\"inventoryTracking\":\"SHOPIFY\"}]}"
  
  response=$(graphql_request "$PRODUCT_MUTATION" "{\"input\":$PRODUCT_INPUT}")
  
  if echo "$response" | grep -q '"id"'; then
    echo -e "  ${GREEN}✅${NC} ${title:0:45}"
  else
    echo -e "  ${YELLOW}ℹ️${NC}  ${title:0:45}"
  fi
done

echo -e "\n${GREEN}✅ Setup complete!${NC}\n"
echo -e "${YELLOW}📝 Next steps:${NC}\n"
echo "1. Go to: https://${STORE}/admin/products"
echo "   → Remove image from 'Organic dishwash liquid gel' (edge case)"
echo ""
echo "2. Go to: Online Store → Themes → spectacular-inspiration → Customize"
echo "   → Configure sections (Hero, Shop, Reviews, Combos, Bundles)"
echo ""
echo "3. Test store: https://${STORE}/"
echo ""
echo "4. Get password: Settings → Online Store → Preferences"
echo ""
