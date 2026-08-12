# Purelane Shopify Theme

A production-ready Shopify Dawn theme implementing the Purelane plant-based homecare homepage with 5 merchant-editable Online Store 2.0 sections.

## Overview

This project converts a static HTML prototype into a live Shopify theme with:
- ✅ 5 custom merchant-editable sections
- ✅ Real product data integration
- ✅ Custom metafields for product attributes
- ✅ Pixel-perfect design match to prototype
- ✅ Full accessibility (WCAG 2.1 AA)
- ✅ Responsive design (375px - 1200px+)
- ✅ Performance optimized (Core Web Vitals)

## Quick Start

### Prerequisites
- Shopify Partner account (free)
- Shopify CLI installed
- Development store with Online Store enabled

### Installation

```bash
# 1. Authenticate with Shopify
shopify auth login

# 2. Clone this repo
git clone https://github.com/v0nser/purelane.git
cd purelane/purelane-shopify-theme

# 3. Push theme to your dev store
shopify theme push --store your-store.myshopify.com

# 4. Live preview (optional)
shopify theme dev --store your-store.myshopify.com
```

## Project Structure

```
purelane-shopify-theme/
├── config/
│   ├── settings_data.json       # Theme configuration
│   └── settings_schema.json     # Settings UI definitions
├── sections/
│   ├── purelane-hero.liquid     # Hero section
│   ├── purelane-shop.liquid     # Product grid
│   ├── purelane-combos.liquid   # Bundle combos
│   ├── purelane-bundles.liquid  # Bundles section
│   ├── purelane-reviews.liquid  # Reviews carousel
│   └── ...                      # Other sections
├── snippets/
│   ├── purelane-product-card.liquid  # Reusable card
│   └── ...
├── assets/
│   ├── purelane.css             # Custom styles (namespaced)
│   ├── purelane.js              # Custom scripts
│   └── ...
├── templates/
│   └── index.json               # Homepage layout
├── layout/
│   ├── theme.liquid             # Main layout
│   └── password.liquid          # Password page
├── locales/
│   └── en.default.json          # Translations
└── docs/
    ├── METAFIELDS.md            # Metafield definitions
    ├── PRODUCT_SEED.md          # Product catalog template
    └── STORE_SETUP.md           # Setup instructions
```

## Sections

### 1. Hero Section (`purelane-hero.liquid`)
Featured product showcase with image, headline, and CTA.

**Settings:**
- Product selection (merchant-editable)
- Headline text
- Button text & link
- Background color/opacity

### 2. Shop / Product Grid (`purelane-shop.liquid`)
Dynamic product display from collection.

**Settings:**
- Collection selection
- Grid columns (responsive)
- Show/hide ratings
- Product card style

**Features:**
- Real-time product data
- Sold-out state handling
- Rating display (via metafields)
- Responsive grid

### 3. Best-Selling Combos (`purelane-combos.liquid`)
Bundle product showcase with tier pricing.

**Settings:**
- Combo product selection
- Pricing display
- Button styling

### 4. Bundles (`purelane-bundles.liquid`)
Collection-based bundle display.

**Settings:**
- Collection selection
- Bundle product links
- Carousel settings

### 5. Reviews Rail (`purelane-reviews.liquid`)
Customer testimonial carousel with infinite scroll.

**Settings:**
- Review quotes (editable in blocks)
- Star ratings
- Author names
- Autoplay settings

**Features:**
- Respects `prefers-reduced-motion`
- Accessible marquee pattern
- ARIA labels for screen readers

## Metafields

Create these in **Settings → Custom data** (namespace: `custom`):

| Key | Type | Example | Used By |
|-----|------|---------|---------|
| `rating` | Number (decimal) | 4.8 | Product card |
| `review_count` | Number (integer) | 237 | Product card |
| `bottle_style` | Single line text | p-kitchen | Product card fallback |

See [docs/METAFIELDS.md](docs/METAFIELDS.md) for full details.

## Product Setup

### Seeding Products

1. **Create products** in Shopify Admin (or import via CSV)
2. **Minimum requirements:** 8 products including:
   - ✅ 1 sold-out product
   - ✅ 1 product with no image
   - ✅ 1 product with 80+ character title

### Suggested Catalog

See [docs/PRODUCT_SEED.md](docs/PRODUCT_SEED.md) for:
- Product titles & pricing
- Inventory setup
- Tags and variants
- CSV import template

### Collection Setup

1. Go to **Products → Collections**
2. Create "All Products" collection
3. Add all products to it
4. Use in Shop section settings

## Theme Editor Configuration

1. Go to **Online Store → Themes → Customize**
2. Configure each section:

### Hero
- Select featured product
- Customize text & colors

### Shop
- Select "All Products" collection
- Choose grid layout

### Combos, Bundles, Reviews
- Leave default or customize per section settings
- Edit review quotes in block editor

## Development

### Local Setup

```bash
cd purelane-shopify-theme

# Watch for changes (auto-syncs to store)
shopify theme dev --store your-store.myshopify.com
```

### Code Style

- **Liquid:** Shopify liquid conventions
- **CSS:** BEM naming, namespaced under `.purelane`
- **JavaScript:** Vanilla JS, no dependencies
- **Comments:** Clear section headers & logic explanations

### Testing

#### Visual Testing
- Test at breakpoints: 375px, 768px, 1200px
- Compare against prototype HTML
- Check animations in theme editor (add/remove sections)

#### Accessibility Testing
- Keyboard navigation (Tab, Enter, Escape)
- Screen reader testing (NVDA/JAWS)
- Color contrast ratio (4.5:1 minimum)
- Reduced motion support

#### Performance
- Lighthouse audit (Google DevTools)
- Core Web Vitals:
  - LCP (Largest Contentful Paint) < 2.5s
  - FID (First Input Delay) < 100ms
  - CLS (Cumulative Layout Shift) < 0.1

## Documentation

- [NOTES.md](NOTES.md) — Build notes & design decisions
- [AI-WORKFLOW.md](AI-WORKFLOW.md) — AI workflow & automation notes
- [docs/METAFIELDS.md](docs/METAFIELDS.md) — Metafield definitions
- [docs/PRODUCT_SEED.md](docs/PRODUCT_SEED.md) — Product catalog template
- [docs/STORE_SETUP.md](docs/STORE_SETUP.md) — Full setup instructions

## Store Details

**Live Store:**
- URL: `purelane-uoz4qfyo.myshopify.com`
- Theme: "spectacular-inspiration"
- Products: 10 seeded
- Collections: "All Products"

**Access:**
- Admin: https://purelane-uoz4qfyo.myshopify.com/admin
- Storefront: https://purelane-uoz4qfyo.myshopify.com/
- Password: [See STORE_SETUP.md]

## Key Features

### Merchant Editability
✅ All content is editable in theme editor
✅ No hardcoded product data
✅ Settings for colors, spacing, text
✅ Product & collection selection via UI

### Performance
✅ Lazy image loading
✅ Minimal JavaScript (vanilla only)
✅ CSS critical path optimization
✅ Responsive image sizing

### Accessibility
✅ Semantic HTML structure
✅ ARIA labels & roles
✅ Keyboard navigation support
✅ `prefers-reduced-motion` respected
✅ Color contrast compliance

### Code Quality
✅ Reusable components (product card snippet)
✅ Namespaced CSS (no global pollution)
✅ Clean Liquid templating
✅ Well-commented code
✅ Git history with meaningful commits

## What Changed from Original HTML

### Original Prototype Issues
- Single 150KB+ file with inline CSS
- Hardcoded product data
- Duplicated DOM elements
- Inconsistent animation handling

### Solutions Implemented
- Modular Liquid sections
- Live Shopify product integration
- Single-source review DOM
- Consistent reduced-motion handling
- Production-ready semantics

See [NOTES.md](NOTES.md) for full technical details.

## Deployment

### Push to Store
```bash
cd purelane-shopify-theme
shopify theme push --store your-store.myshopify.com
```

### Publish Theme
1. Go to **Online Store → Themes**
2. Find "spectacular-inspiration"
3. Click **Actions → Publish** (to make it live)

## Support & Resources

- [Shopify Theme Development Docs](https://shopify.dev/themes)
- [Liquid Reference](https://shopify.dev/api/liquid)
- [Shopify CLI Docs](https://shopify.dev/themes/tools/cli)
- [Dawn Theme (Official)](https://github.com/Shopify/dawn)

## Author Notes

Built as a Troopod AI Product Engineer assignment. This theme demonstrates:
- Production-quality Shopify development
- Merchant-focused design patterns
- Accessibility & performance best practices
- Clean, maintainable code architecture

See [AI-WORKFLOW.md](AI-WORKFLOW.md) for development workflow insights.

## License

This is a proprietary theme built for Purelane. See LICENSE.md for details.

---

**Last Updated:** 2026-08-12
**Status:** ✅ Production Ready
**Shopify API Version:** 2024-01