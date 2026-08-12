# 🚀 Complete Setup Guide (15 minutes)

Your Purelane theme is deployed! Now complete these 5 quick manual steps:

**Store Admin:** https://w0eg31-en.myshopify.com/admin

---

## Step 1️⃣: Create 4 Metafields (5 min)

**Path:** Settings → Apps and integrations → Custom data → Products

Create these 4 product metafields with namespace `custom`:

### 1. Rating
- **Key:** `rating`
- **Type:** Number (decimal)
- Click "Save"

### 2. Review Count
- **Key:** `review_count`
- **Type:** Number (integer)
- Click "Save"

### 3. Bottle Style
- **Key:** `bottle_style`
- **Type:** Single line text
- Click "Save"

### 4. Bundle Components (optional)
- **Key:** `bundle_components`
- **Type:** Product reference (list)
- Click "Save"

✅ **Check:** All 4 should appear in the list

---

## Step 2️⃣: Import Products from CSV (2 min)

**Path:** Products → Import products

1. **Download this CSV file:**
   - `/workspaces/purelane/purelane-shopify-theme/scripts/seed-products.csv`

2. **In Shopify Admin:**
   - Click **Import products**
   - Select the CSV file
   - Click **Upload file**
   - Review the preview
   - Click **Import**

✅ **Check:** You should see 10 new products in your Products list
- "Tap cleaner & limescale remover" ✓
- "Kitchen cleaner foaming" ✓
- etc.

---

## Step 3️⃣: Add Missing Edge Case (1 min)

**Path:** Products → Search → "Organic dishwash"

1. Click **Organic dishwash liquid gel**
2. Scroll to Media section
3. Click the image to select it
4. Click the ✕ (delete icon)
5. Click **Save product**

✅ **Check:** Product shows "No media" in grid

---

## Step 4️⃣: Link Products in Theme Editor (3 min)

**Path:** Online Store → Themes → "spectacular-inspiration" → Customize

### Hero Section
1. Click the "Hero" section in the preview
2. In the sidebar, scroll down to "Product"
3. Select any product (e.g., "Tap cleaner & limescale remover")
4. Click "Done"

### Shop Section
1. Click the "Shop" section in the preview  
2. In the sidebar, look for "Collection"
3. Select **"All Products"** (or any collection you have)
   - If no collection exists, create one first:
     - Products → Collections → Create collection
     - Name: "All Products"
     - Add all 10 products
     - Save
4. Click "Done"

### Leave These As-Is:
- **Reviews** - has fallback content
- **Combos** - has fallback content
- **Bundles** - has fallback content

5. Click **Save** (top right)

✅ **Check:** Homepage preview updates with real products

---

## Step 5️⃣: Test & Get Password (2 min)

### Test Storefront
**Visit:** https://w0eg31-en.myshopify.com/

Verify:
- ✅ Hero displays featured product
- ✅ Shop grid shows 10 products with prices
- ✅ Sold-out badge on "Non-toxic laundry detergent"
- ✅ "Organic dishwash liquid gel" shows fallback (no image)
- ✅ "Plant-based multipurpose cleaner..." long title visible
- ✅ Mobile works (375px)

### Get Store Password
**Path:** Settings → Online Store → Preferences

- Copy the **storefront access password**
- Save it (you need this for submission)

---

## ✅ Complete! Ready to Submit

Once all 5 steps are done:

1. **GitHub repo** is ready:
   ```bash
   cd /workspaces/purelane
   git status
   git add -A
   git commit -m "Setup: Purelane Shopify theme with metafields, products, and collections"
   git push
   ```

2. **Deliverables** to send to `nj@troopod.io`:

   **Subject:** `AI Product Engineer Assignment - Your Name`

   **Content:**
   - Dev store URL: `w0eg31-en.myshopify.com`
   - Storefront password: [from Settings → Online Store → Preferences]
   - GitHub repo: https://github.com/v0nser/purelane
   - Metafield definitions: (copy from Custom data section)
   - File attachments:
     - `NOTES.md` (already done ✓)
     - `AI-WORKFLOW.md` (already done ✓)

3. **Key checklist:**
   - [ ] 10 products in store
   - [ ] 1 sold-out product
   - [ ] 1 product with no image
   - [ ] 1 product with 80+ char title
   - [ ] 4 metafields created
   - [ ] All 5 sections rendering on homepage
   - [ ] Mobile layout works (375px)
   - [ ] Theme editor (add/remove/reorder) works
   - [ ] Store password saved
   - [ ] GitHub commit history clean

---

**⏱️ Total time:** ~15 minutes

Need help with any step? Let me know!
