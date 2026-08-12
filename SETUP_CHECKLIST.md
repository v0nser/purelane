# Purelane Shopify Store Setup Checklist

**Store URL**: https://w0eg31-en.myshopify.com/admin
**Store Front**: https://w0eg31-en.myshopify.com

## ✅ Completed
- [x] Store created
- [x] Theme pushed (spectacular-inspiration)
- [x] All 5 sections deployed

## 📋 Quick Setup (Manual - ~10 minutes total)

### Step 1: Create Metafields (Settings → Custom data)
**Namespace: `custom`** (all fields)

Copy-paste these 4 definitions:

#### 1. Rating
- Key: `rating`
- Type: Number (decimal)
- Admin visibility: Read/Write
- Storefront visibility: Read

#### 2. Review Count  
- Key: `review_count`
- Type: Number (integer)
- Admin visibility: Read/Write
- Storefront visibility: Read

#### 3. Bottle Style
- Key: `bottle_style`
- Type: Single line text
- Admin visibility: Read/Write
- Storefront visibility: Read

#### 4. Bundle Components (optional)
- Key: `bundle_components`
- Type: Product reference (list)
- Admin visibility: Read/Write
- Storefront visibility: Read

---

### Step 2: Import Products via CSV
**File**: `/workspaces/purelane/purelane-shopify-theme/scripts/seed-products.csv`

**In Admin:**
1. Products → Import
2. Upload `seed-products.csv`
3. Review & Complete

**Includes:**
- ✅ 10 products total
- ✅ 1 sold-out: "Non-toxic laundry detergent" (inventory=0)
- ✅ 1 very long title: "Plant-based multipurpose cleaner..."
- ⚠️ Need to add: 1 product with no image (delete image from one after import)

**After import**, select one product (e.g., "Organic dishwash liquid gel") and delete its image to fulfill the "no image" edge case.

---

### Step 3: Create Collections
1. **Products → Collections** → Create collection
2. Name: `All Products`
3. Add all 10 products
4. Save

---

### Step 4: Link Products in Theme Editor
**Online Store → Themes → "spectacular-inspiration" → Customize**

Homepage sections to configure:

#### Hero Section
- Select featured product (e.g., "Tap cleaner & limescale remover")

#### Shop Section  
- Select collection: `All Products`

#### Combos Section
- Link bundle products (or leave with fallback text for now)

#### Reviews Section
- Review quotes auto-populate (static in section blocks)

#### Bundles Section
- Link bundle products (optional)

---

## 🧪 Testing Checklist (after setup)

- [ ] Store password captured (Online Store → Preferences)
- [ ] Visit storefront: https://w0eg31-en.myshopify.com/
- [ ] Hero displays featured product image
- [ ] Shop grid shows 10 products with prices
- [ ] Sold-out product shows "Sold out" badge
- [ ] Long-title product truncates properly
- [ ] Product without image shows fallback
- [ ] Review section renders
- [ ] Combos section renders
- [ ] Mobile (375px) layout works
- [ ] Theme editor: add/remove sections without breaking

---

## 📦 Deliverables Needed

When complete, send to `nj@troopod.io`:

1. **Store URL & password**
   - Store: `w0eg31-en.myshopify.com`
   - Password: [from Online Store → Preferences]

2. **GitHub URL** (with commit history)
   - https://github.com/v0nser/purelane

3. **Metafield definitions** (copy from admin)

4. **Build notes** (what changed from original HTML)
   - See: [`NOTES.md`](./NOTES.md)

5. **AI workflow notes** (what you delegated)
   - Document in: [`AI-WORKFLOW.md`](./AI-WORKFLOW.md)

---

## ⏱️ Time Estimate
- Metafields: 5 min
- CSV import: 2 min  
- Collection setup: 2 min
- Theme configuration: 3 min
- Testing: 5 min
- **Total: ~15-20 minutes**
