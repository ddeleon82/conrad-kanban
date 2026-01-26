# Freedom & Coffee Client Dashboard
## Product Requirements Document (PRD)

**Version:** 1.0  
**Date:** January 26, 2025  
**Author:** Freedom & Coffee Product Team  
**Status:** Draft

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Problem Statement](#2-problem-statement)
3. [Target Users](#3-target-users)
4. [Core Features](#4-core-features)
5. [Data Integration Architecture](#5-data-integration-architecture)
6. [Authentication & Multi-tenancy Design](#6-authentication--multi-tenancy-design)
7. [Dashboard Components & Visualizations](#7-dashboard-components--visualizations)
8. [Automated Daily Updates](#8-automated-daily-updates)
9. [User Stories](#9-user-stories)
10. [Technical Requirements](#10-technical-requirements)
11. [Competitive Analysis](#11-competitive-analysis)
12. [MVP Scope vs Future Features](#12-mvp-scope-vs-future-features)
13. [Success Metrics](#13-success-metrics)

---

## 1. Executive Summary

### Vision
Build a modern, interactive client dashboard that empowers Freedom & Coffee's agency clients to monitor their advertising campaign performance in real-time, fostering transparency, reducing manual reporting overhead, and strengthening client relationships.

### Product Overview
The Freedom & Coffee Client Dashboard is a white-labeled, web-based application that consolidates programmatic advertising and Meta (Facebook/Instagram) campaign data into a unified, intuitive interface. Clients can securely log in to view their campaign metrics, analyze performance trends, and download reports—all without requiring agency intervention.

### Business Objectives
- **Reduce reporting overhead** by 70% through automated daily data updates
- **Improve client retention** by providing transparent, self-service access to campaign data
- **Differentiate Freedom & Coffee** from competitors with superior client experience
- **Scale operations** without proportionally increasing account management resources

### Key Value Propositions
1. **Single Source of Truth**: All campaign data in one place
2. **Real-time Transparency**: Daily automated updates
3. **Client Empowerment**: Self-service reporting and insights
4. **Agency Efficiency**: Automated reporting frees team for strategic work
5. **Professional Branding**: White-labeled experience reinforces agency credibility

---

## 2. Problem Statement

### Current State
- **Manual Reporting**: Account managers spend 5-10 hours weekly compiling reports across platforms
- **Data Fragmentation**: Programmatic and Meta data live in separate platforms with no unified view
- **Client Frustration**: Clients wait for weekly/monthly reports instead of accessing data on-demand
- **Scalability Issues**: Each new client increases reporting workload linearly
- **Limited Transparency**: Clients lack visibility into day-to-day campaign performance

### Pain Points by Stakeholder

| Stakeholder | Pain Points |
|-------------|-------------|
| **Clients** | Can't access data on-demand; reports are delayed; no interactive exploration; manual requests for custom date ranges |
| **Account Managers** | Hours spent on manual reporting; repetitive data exports; responding to ad-hoc client requests; maintaining spreadsheets |
| **Agency Leadership** | Difficulty scaling; high operational costs; client churn due to lack of transparency; competitive disadvantage |

### Root Causes
1. No centralized data platform connecting all advertising sources
2. Lack of client-facing self-service tools
3. Reliance on manual processes for data aggregation and visualization
4. No automated data refresh mechanism

### Desired Outcome
An automated, self-service dashboard that:
- Consolidates all campaign data in one unified interface
- Updates automatically on a daily basis
- Provides clients with 24/7 access to their performance data
- Eliminates 70%+ of manual reporting tasks
- Supports agency growth without proportional headcount increase

---

## 3. Target Users

### Primary Users: Agency Clients

#### Client Persona 1: Marketing Director (Maria)
- **Role**: Marketing Director at a mid-size e-commerce company
- **Age**: 35-45
- **Tech Savvy**: Moderate
- **Goals**: 
  - Justify ad spend to CEO/CFO
  - Understand ROI across channels
  - Make data-informed budget decisions
- **Frustrations**:
  - Waiting for weekly reports
  - Difficulty comparing performance across platforms
  - Can't quickly answer executive questions
- **Dashboard Usage**: Weekly deep-dives, monthly board report prep

#### Client Persona 2: Digital Marketing Manager (David)
- **Role**: Digital Marketing Manager at a B2B SaaS company
- **Age**: 28-38
- **Tech Savvy**: High
- **Goals**:
  - Monitor campaign performance daily
  - Identify optimization opportunities
  - Track against KPIs
- **Frustrations**:
  - Manual data exports take too long
  - Multiple logins to different platforms
  - No unified view of programmatic + social
- **Dashboard Usage**: Daily monitoring, ad-hoc analysis

#### Client Persona 3: Business Owner (Brandon)
- **Role**: Owner of a local services business
- **Age**: 40-55
- **Tech Savvy**: Low to Moderate
- **Goals**:
  - Understand if advertising is working
  - See simple, clear metrics
  - Trust the agency is delivering value
- **Frustrations**:
  - Technical jargon in reports
  - Too much data, unclear what matters
  - Limited time to analyze
- **Dashboard Usage**: Quick weekly check-ins, focus on summary metrics

### Secondary Users: Agency Team

#### Internal Persona: Account Manager (Alex)
- **Role**: Freedom & Coffee Account Manager
- **Goals**:
  - Reduce time on manual reporting
  - Proactively identify issues before clients notice
  - Prepare for client calls efficiently
- **Dashboard Usage**: Client call prep, performance monitoring

### User Segmentation

| Segment | Data Complexity | Update Frequency | Primary Metrics |
|---------|-----------------|------------------|-----------------|
| Enterprise | High (multi-channel, multi-campaign) | Daily | ROAS, CAC, Attribution |
| Mid-Market | Medium | Daily/Weekly | Conversions, CPA, Impressions |
| SMB | Low | Weekly | Leads, Clicks, Spend |

---

## 4. Core Features

### 4.1 Dashboard Home

#### Summary View
- **KPI Cards**: Key metrics at a glance (Spend, Impressions, Clicks, Conversions, ROAS)
- **Period Comparison**: Current vs. previous period with delta indicators
- **Channel Breakdown**: Split by Programmatic vs. Meta
- **Recent Alerts**: Any anomalies or notable changes

#### Quick Actions
- Date range selector (presets + custom)
- Export to PDF/CSV
- Campaign filter dropdown
- Refresh data button (manual trigger)

### 4.2 Campaign Performance

#### Campaign List View
- Sortable/filterable table of all active campaigns
- Status indicators (Active, Paused, Ended)
- Key metrics per campaign: Spend, Impressions, Clicks, CTR, Conversions, CPA
- Sparkline trends for quick visual analysis

#### Campaign Detail View
- Deep dive into individual campaign metrics
- Day-by-day performance chart
- Breakdown by:
  - Ad creative (where available)
  - Placement (Meta: Feed, Stories, Reels; Programmatic: Display, Video, CTV)
  - Device type
  - Geographic region (if applicable)

### 4.3 Channel Analytics

#### Programmatic Dashboard
- Inventory source breakdown
- Viewability metrics
- Brand safety scores
- Frequency capping data
- Audience segment performance

#### Meta (Facebook/Instagram) Dashboard
- Platform split (Facebook vs. Instagram)
- Placement performance (Feed, Stories, Reels, Audience Network)
- Ad format comparison (Image, Video, Carousel, Collection)
- Audience insights (demographics, interests if available via API)

### 4.4 Reporting & Export

#### Automated Reports
- Scheduled PDF reports (weekly/monthly)
- Email delivery to designated recipients
- Customizable report templates

#### Ad-Hoc Export
- CSV export of all data
- PDF snapshot of current view
- Date range selection for historical data

### 4.5 Alerts & Notifications

#### Configurable Alerts
- Spend pacing alerts (under/over budget)
- Performance anomalies (significant CTR drops, conversion spikes)
- Campaign status changes

#### Notification Channels
- In-dashboard notification center
- Email notifications
- Optional: Slack integration (future)

### 4.6 Settings & Account Management

#### User Profile
- Update password
- Email preferences
- Notification settings

#### Client Settings (Admin)
- Manage user access
- Configure dashboard layout
- Set report preferences

---

## 5. Data Integration Architecture

### 5.1 Overview Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          DATA SOURCES                                       │
├───────────────────────────────┬─────────────────────────────────────────────┤
│     PROGRAMMATIC DSPs         │              META PLATFORMS                 │
│  ┌─────────────────────────┐  │  ┌─────────────────────────────────────┐    │
│  │ • The Trade Desk        │  │  │ • Facebook Ads Manager              │    │
│  │ • DV360                 │  │  │ • Instagram Ads                     │    │
│  │ • Amazon DSP            │  │  │                                     │    │
│  │ • Yahoo DSP             │  │  └─────────────────────────────────────┘    │
│  └─────────────────────────┘  │                                             │
└───────────────────────────────┴─────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                          INTEGRATION LAYER                                  │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                        API CONNECTORS                               │    │
│  │  • OAuth 2.0 Authentication                                        │    │
│  │  • Rate Limiting & Retry Logic                                     │    │
│  │  • Data Transformation & Normalization                             │    │
│  │  • Error Handling & Logging                                        │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                     ETL PIPELINE (Daily Batch)                      │    │
│  │  • Extract: Pull data from source APIs                             │    │
│  │  • Transform: Normalize, enrich, aggregate                         │    │
│  │  • Load: Insert into data warehouse                                │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                          DATA STORAGE                                       │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                    DATA WAREHOUSE                                   │    │
│  │  • PostgreSQL / BigQuery                                           │    │
│  │  • Normalized schema with fact/dimension tables                    │    │
│  │  • Client data isolation (tenant_id on all tables)                 │    │
│  │  • Historical data retention (rolling 24 months)                   │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                     CACHING LAYER                                   │    │
│  │  • Redis for frequently accessed queries                           │    │
│  │  • Pre-computed aggregations for dashboard load                    │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                          APPLICATION LAYER                                  │
│  ┌──────────────────────┐  ┌────────────────────┐  ┌────────────────────┐   │
│  │     API Server       │  │   Auth Service     │  │  Notification Svc  │   │
│  │  (Node.js/Python)    │  │   (JWT + OAuth)    │  │   (Email/Alerts)   │   │
│  └──────────────────────┘  └────────────────────┘  └────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                          PRESENTATION LAYER                                 │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                   CLIENT DASHBOARD (React/Next.js)                  │    │
│  │  • Responsive web application                                      │    │
│  │  • Interactive charts (Chart.js / D3.js)                           │    │
│  │  • White-label theming                                             │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 5.2 Programmatic Data Integration

#### Data Sources
| Platform | API Type | Auth Method | Rate Limits | Key Endpoints |
|----------|----------|-------------|-------------|---------------|
| The Trade Desk | REST API | OAuth 2.0 | 1000 req/min | `/campaigns`, `/reports` |
| DV360 | DBM Reporting API | OAuth 2.0 | Standard Google quota | Reporting API |
| Amazon DSP | Amazon Ads API | OAuth 2.0 | 10 req/sec | Reporting endpoints |

#### Key Metrics (Programmatic)
- **Delivery**: Impressions, Clicks, Video Views, Completions
- **Performance**: CTR, VCR, Viewability Rate
- **Cost**: Spend, CPM, CPC, CPCV
- **Conversions**: Total conversions, Post-click, Post-view, CPA, ROAS

#### Data Normalization
All programmatic platforms will be mapped to a unified schema:
```sql
programmatic_daily_metrics (
    id SERIAL PRIMARY KEY,
    tenant_id UUID NOT NULL,
    campaign_id VARCHAR(255),
    campaign_name VARCHAR(500),
    source_platform ENUM('ttd', 'dv360', 'amazon'),
    date DATE NOT NULL,
    impressions BIGINT,
    clicks BIGINT,
    spend DECIMAL(12,2),
    conversions INTEGER,
    video_views BIGINT,
    video_completions BIGINT,
    viewable_impressions BIGINT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
)
```

### 5.3 Meta Data Integration

#### Meta Marketing API Integration
- **API Version**: v18.0 (latest stable)
- **Authentication**: OAuth 2.0 with System User tokens
- **Permissions Required**: `ads_read`, `read_insights`, `business_management`

#### Key Endpoints
| Endpoint | Purpose | Frequency |
|----------|---------|-----------|
| `/act_{ad_account_id}/insights` | Campaign performance data | Daily |
| `/act_{ad_account_id}/campaigns` | Campaign metadata | Daily |
| `/act_{ad_account_id}/ads` | Ad-level details | Daily |

#### Key Metrics (Meta)
- **Reach & Frequency**: Impressions, Reach, Frequency
- **Engagement**: Clicks, CTR, Post Engagement, Video Views
- **Cost**: Spend, CPM, CPC, Cost per Result
- **Conversions**: Leads, Purchases, Registrations, ROAS, CPA

#### Data Schema
```sql
meta_daily_metrics (
    id SERIAL PRIMARY KEY,
    tenant_id UUID NOT NULL,
    campaign_id VARCHAR(255),
    campaign_name VARCHAR(500),
    adset_id VARCHAR(255),
    ad_id VARCHAR(255),
    platform ENUM('facebook', 'instagram'),
    placement VARCHAR(100),
    date DATE NOT NULL,
    impressions BIGINT,
    reach BIGINT,
    clicks BIGINT,
    spend DECIMAL(12,2),
    conversions INTEGER,
    video_views BIGINT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
)
```

### 5.4 Unified Data Model

#### Combined Metrics View
```sql
CREATE VIEW unified_campaign_metrics AS
SELECT 
    tenant_id,
    campaign_id,
    campaign_name,
    'programmatic' AS channel,
    source_platform AS source,
    date,
    impressions,
    clicks,
    spend,
    conversions,
    CASE WHEN impressions > 0 THEN clicks::DECIMAL / impressions ELSE 0 END AS ctr,
    CASE WHEN clicks > 0 THEN spend / clicks ELSE 0 END AS cpc,
    CASE WHEN conversions > 0 THEN spend / conversions ELSE 0 END AS cpa
FROM programmatic_daily_metrics

UNION ALL

SELECT 
    tenant_id,
    campaign_id,
    campaign_name,
    'meta' AS channel,
    platform AS source,
    date,
    impressions,
    clicks,
    spend,
    conversions,
    CASE WHEN impressions > 0 THEN clicks::DECIMAL / impressions ELSE 0 END AS ctr,
    CASE WHEN clicks > 0 THEN spend / clicks ELSE 0 END AS cpc,
    CASE WHEN conversions > 0 THEN spend / conversions ELSE 0 END AS cpa
FROM meta_daily_metrics;
```

---

## 6. Authentication & Multi-tenancy Design

### 6.1 Authentication Architecture

#### Authentication Flow
```
┌──────────┐    ┌──────────────┐    ┌─────────────┐    ┌──────────┐
│  Client  │───▶│ Login Page   │───▶│ Auth Server │───▶│ Dashboard│
│  Browser │    │ (Email/Pass) │    │ (JWT Issue) │    │ (Access) │
└──────────┘    └──────────────┘    └─────────────┘    └──────────┘
                                           │
                                           ▼
                                    ┌─────────────┐
                                    │   Database  │
                                    │ (User Data) │
                                    └─────────────┘
```

#### Authentication Methods
1. **Email/Password** (Primary)
   - Bcrypt password hashing (cost factor 12)
   - Email verification on signup
   - Password strength requirements (min 12 chars, mixed case, numbers)

2. **Magic Link** (Optional)
   - Passwordless email authentication
   - 15-minute expiry tokens
   - Single-use links

3. **SSO/SAML** (Enterprise, Future)
   - Integration with client identity providers
   - JIT provisioning

#### JWT Token Strategy
```json
{
  "header": {
    "alg": "RS256",
    "typ": "JWT"
  },
  "payload": {
    "sub": "user_uuid",
    "tenant_id": "client_uuid",
    "role": "client_admin|client_viewer|agency_admin",
    "permissions": ["read:campaigns", "read:reports", "export:data"],
    "iat": 1706230400,
    "exp": 1706316800
  }
}
```

- **Access Token**: 24-hour expiry
- **Refresh Token**: 30-day expiry, stored in HTTP-only cookie
- **Token Rotation**: Refresh tokens rotated on each use

### 6.2 Multi-tenancy Model

#### Architecture: Shared Database, Isolated Data
```
┌─────────────────────────────────────────────────────────────────┐
│                    SINGLE DATABASE INSTANCE                     │
├─────────────────────────────────────────────────────────────────┤
│  ┌───────────────┐  ┌───────────────┐  ┌───────────────┐       │
│  │  Tenant A     │  │  Tenant B     │  │  Tenant C     │       │
│  │  (Client 1)   │  │  (Client 2)   │  │  (Client 3)   │       │
│  │  tenant_id=X  │  │  tenant_id=Y  │  │  tenant_id=Z  │       │
│  └───────────────┘  └───────────────┘  └───────────────┘       │
│                                                                 │
│  All tables include tenant_id column with row-level security   │
└─────────────────────────────────────────────────────────────────┘
```

#### Tenant Isolation Strategy
1. **Row-Level Security (RLS)**
   - PostgreSQL RLS policies enforce tenant isolation at database level
   - All queries automatically filtered by `tenant_id`

2. **Application-Level Enforcement**
   - Middleware injects `tenant_id` from JWT into all database queries
   - API endpoints validate user belongs to requested tenant

3. **Audit Logging**
   - All data access logged with user and tenant context
   - Alerting on cross-tenant access attempts

#### Database Schema (Tenants)
```sql
-- Tenants (Clients)
CREATE TABLE tenants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    logo_url VARCHAR(500),
    primary_color VARCHAR(7),
    created_at TIMESTAMP DEFAULT NOW(),
    status ENUM('active', 'suspended', 'churned') DEFAULT 'active'
);

-- Users
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID REFERENCES tenants(id),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role ENUM('agency_admin', 'client_admin', 'client_viewer') NOT NULL,
    last_login_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW(),
    status ENUM('active', 'invited', 'disabled') DEFAULT 'invited'
);

-- Row-Level Security Policy
ALTER TABLE programmatic_daily_metrics ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_isolation ON programmatic_daily_metrics
    FOR ALL
    USING (tenant_id = current_setting('app.current_tenant')::UUID);
```

### 6.3 Role-Based Access Control (RBAC)

#### Roles & Permissions

| Role | Description | Permissions |
|------|-------------|-------------|
| `agency_admin` | Freedom & Coffee team | Full access to all tenants, user management, system config |
| `client_admin` | Client's main contact | Full access to own tenant, can invite users, manage settings |
| `client_viewer` | Client team member | Read-only access to dashboards and reports |

#### Permission Matrix

| Action | Agency Admin | Client Admin | Client Viewer |
|--------|-------------|--------------|---------------|
| View Dashboard | ✅ | ✅ | ✅ |
| Export Data | ✅ | ✅ | ✅ |
| Configure Alerts | ✅ | ✅ | ❌ |
| Invite Users | ✅ | ✅ | ❌ |
| Manage Settings | ✅ | ✅ | ❌ |
| Access Other Tenants | ✅ | ❌ | ❌ |
| System Configuration | ✅ | ❌ | ❌ |

---

## 7. Dashboard Components & Visualizations

### 7.1 Layout Structure

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  HEADER                                                                     │
│  ┌─────────────────┬─────────────────────────────────────┬───────────────┐  │
│  │  [Logo]         │ Campaign Selector | Date Range      │ [User Menu]   │  │
│  └─────────────────┴─────────────────────────────────────┴───────────────┘  │
├──────────┬──────────────────────────────────────────────────────────────────┤
│  SIDEBAR │  MAIN CONTENT AREA                                               │
│  ┌──────┐│  ┌─────────────────────────────────────────────────────────────┐ │
│  │      ││  │  KPI SUMMARY CARDS                                          │ │
│  │ Nav  ││  │  [Spend] [Impressions] [Clicks] [Conversions] [ROAS]        │ │
│  │      ││  └─────────────────────────────────────────────────────────────┘ │
│  │      ││  ┌────────────────────────────┬────────────────────────────────┐ │
│  │ Home ││  │  PERFORMANCE TREND         │  CHANNEL DISTRIBUTION          │ │
│  │      ││  │  [Line Chart]              │  [Donut Chart]                 │ │
│  │Camps ││  │                            │                                │ │
│  │      ││  └────────────────────────────┴────────────────────────────────┘ │
│  │ Meta ││  ┌─────────────────────────────────────────────────────────────┐ │
│  │      ││  │  CAMPAIGN TABLE                                             │ │
│  │Prog. ││  │  [Sortable, filterable data table]                          │ │
│  │      ││  │                                                             │ │
│  │Rprts ││  └─────────────────────────────────────────────────────────────┘ │
│  │      ││                                                                  │
│  │Stngs ││                                                                  │
│  └──────┘│                                                                  │
└──────────┴──────────────────────────────────────────────────────────────────┘
```

### 7.2 Component Library

#### KPI Summary Cards
```
┌─────────────────────────────┐
│  Total Spend                │
│  $24,567.89                 │
│  ▲ 12.4% vs prev period     │
│  ━━━━━━━━━━ (sparkline)     │
└─────────────────────────────┘
```

**Specifications:**
- Metric label (e.g., "Total Spend")
- Primary value (formatted appropriately)
- Period-over-period change (with directional indicator)
- Sparkline showing 7-day trend
- Click to drill down

#### Performance Trend Chart
```
     │
     │         ╭───╮
     │    ╭───╯    ╰──╮
     │ ╭──╯            ╰───╮
     │╯                     ╰──
     └────────────────────────►
       Mon  Tue  Wed  Thu  Fri
```

**Specifications:**
- Line chart with multiple series (Spend, Conversions, Clicks)
- Toggleable metrics
- Hover tooltips with detailed values
- Date range responds to global filter
- Export as PNG option

#### Channel Distribution Donut
```
       ╭───────────╮
      ╱   ╭───────╮ ╲
     │   │       │   │
     │   │ Meta  │   │
     │   │ 62%   │   │
      ╲   ╰───────╯ ╱
       ╰───────────╯
        Programmatic
           38%
```

**Specifications:**
- Donut chart showing spend/performance split
- Interactive legend
- Click segment to filter dashboard
- Center shows total value

#### Campaign Data Table
```
┌──────────────┬──────────┬────────────┬─────────┬──────────┬─────────┐
│ Campaign     │ Status   │ Spend      │ Impr.   │ Clicks   │ Conv.   │
├──────────────┼──────────┼────────────┼─────────┼──────────┼─────────┤
│ Summer Sale  │ ● Active │ $5,234.00  │ 125.4K  │ 3,421    │ 89      │
│ Brand Aware  │ ● Active │ $8,012.50  │ 432.1K  │ 5,123    │ 45      │
│ Retargeting  │ ○ Paused │ $2,100.00  │ 89.2K   │ 2,011    │ 123     │
└──────────────┴──────────┴────────────┴─────────┴──────────┴─────────┘
```

**Specifications:**
- Sortable columns (click header)
- Filterable (search + dropdown filters)
- Pagination (25/50/100 rows per page)
- Row click → Campaign detail view
- Inline sparklines optional

### 7.3 Visualization Library (Chart Types)

| Chart Type | Use Case | Library |
|------------|----------|---------|
| Line Chart | Trends over time | Chart.js |
| Bar Chart | Comparisons | Chart.js |
| Donut/Pie | Distribution | Chart.js |
| Stacked Bar | Part-to-whole over time | Chart.js |
| Heat Map | Day/hour performance | D3.js |
| Funnel | Conversion visualization | Custom SVG |
| Gauge | Goal progress | Custom SVG |
| Data Table | Detailed data exploration | TanStack Table |

### 7.4 Interactive Features

1. **Global Filters**
   - Date range picker (presets: Today, Last 7/14/30/90 days, Custom)
   - Campaign multi-select
   - Channel filter (All, Programmatic, Meta)

2. **Drill-Down**
   - Click KPI card → filtered view
   - Click chart segment → apply filter
   - Click table row → detail page

3. **Tooltips**
   - Hover on any data point for details
   - Contextual information (metric definition, calculation)

4. **Comparison Mode**
   - Enable period comparison
   - Side-by-side or overlay visualization

5. **Annotations**
   - Client can add notes to specific dates
   - Agency can add context markers (e.g., "Campaign launched")

---

## 8. Automated Daily Updates

### 8.1 ETL Pipeline Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          DAILY ETL PIPELINE                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌──────────────┐     ┌──────────────┐     ┌──────────────┐                │
│  │   TRIGGER    │────▶│   EXTRACT    │────▶│  TRANSFORM   │                │
│  │  (Scheduler) │     │  (API Calls) │     │ (Normalize)  │                │
│  └──────────────┘     └──────────────┘     └──────────────┘                │
│         │                    │                    │                        │
│    06:00 UTC                 │                    │                        │
│    Daily                     │                    │                        │
│                              ▼                    ▼                        │
│                    ┌──────────────────────────────────────┐                │
│                    │           DATA WAREHOUSE             │                │
│                    │  • Raw data tables (staging)         │                │
│                    │  • Processed data tables             │                │
│                    │  • Pre-computed aggregations         │                │
│                    └──────────────────────────────────────┘                │
│                                       │                                    │
│                                       ▼                                    │
│                         ┌──────────────────────────┐                       │
│                         │    POST-LOAD TASKS       │                       │
│                         │  • Cache warming         │                       │
│                         │  • Alert evaluation      │                       │
│                         │  • Anomaly detection     │                       │
│                         │  • Status notification   │                       │
│                         └──────────────────────────┘                       │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 8.2 Schedule

| Task | Schedule | Duration | Dependencies |
|------|----------|----------|--------------|
| Meta API Extract | 06:00 UTC | ~30 min | None |
| Programmatic API Extract | 06:00 UTC | ~45 min | None |
| Data Transformation | 07:00 UTC | ~15 min | Extract complete |
| Aggregation & Load | 07:30 UTC | ~10 min | Transform complete |
| Cache Warming | 08:00 UTC | ~5 min | Load complete |
| Alert Evaluation | 08:15 UTC | ~10 min | Cache warmed |
| Status Notification | 08:30 UTC | ~1 min | All tasks complete |

### 8.3 Data Freshness

| Data Type | Freshness | Notes |
|-----------|-----------|-------|
| Campaign Metrics | T-1 (previous day) | Final data available ~6 hours after midnight |
| Spend Data | T-1 | Reconciled daily |
| Conversion Data | T-1 to T-2 | Some attribution windows delay reporting |
| Campaign Status | Near real-time | Cached, refreshed hourly during business hours |

### 8.4 Error Handling & Recovery

#### Failure Scenarios

| Scenario | Detection | Response |
|----------|-----------|----------|
| API Rate Limit | HTTP 429 | Exponential backoff, retry up to 3x |
| API Timeout | No response > 60s | Retry with increased timeout |
| Auth Token Expired | HTTP 401 | Refresh token, retry |
| Data Validation Failure | Schema mismatch | Log error, skip record, alert ops |
| Complete Pipeline Failure | No data loaded | Alert ops team, use previous day's data |

#### Recovery Procedures
1. **Automatic Retry**: Failed tasks retry 3 times with exponential backoff
2. **Manual Backfill**: Admin can trigger backfill for specific date ranges
3. **Data Reconciliation**: Weekly job compares source totals to warehouse totals
4. **Alerting**: Slack/email alerts for any pipeline failures

### 8.5 Monitoring & Observability

#### Key Metrics
- Pipeline execution time (by stage)
- Records processed (by source)
- Error rate
- Data freshness (time since last successful update)
- API call count and latency

#### Monitoring Stack
- **Logging**: Structured JSON logs → CloudWatch/Datadog
- **Metrics**: Prometheus + Grafana
- **Alerting**: PagerDuty for critical failures

---

## 9. User Stories

### 9.1 Client User Stories

#### Dashboard Access & Navigation

| ID | Story | Acceptance Criteria | Priority |
|----|-------|---------------------|----------|
| US-001 | As a client, I want to log in securely so I can access my campaign data | Given valid credentials, when I log in, then I see my dashboard within 3 seconds | P0 |
| US-002 | As a client, I want to see a summary of my campaign performance at a glance | Given I'm logged in, when I view the dashboard, then I see KPI cards for Spend, Impressions, Clicks, Conversions, and ROAS | P0 |
| US-003 | As a client, I want to filter data by date range so I can analyze specific periods | Given I'm on the dashboard, when I select a date range, then all visualizations update to show data for that period | P0 |
| US-004 | As a client, I want to compare performance to previous periods | Given I'm viewing a metric, when I enable comparison mode, then I see current vs. previous period with % change | P1 |

#### Campaign Analysis

| ID | Story | Acceptance Criteria | Priority |
|----|-------|---------------------|----------|
| US-005 | As a client, I want to see a list of all my campaigns | Given I navigate to Campaigns, when the page loads, then I see a table with all campaigns and key metrics | P0 |
| US-006 | As a client, I want to drill into a specific campaign's performance | Given I click on a campaign row, when the detail view loads, then I see day-by-day metrics and breakdowns | P0 |
| US-007 | As a client, I want to see my Programmatic and Meta data separately | Given I navigate to the channel-specific pages, when they load, then I see metrics specific to that channel | P1 |
| US-008 | As a client, I want to understand which placements perform best | Given I view campaign details, when I scroll to placement breakdown, then I see performance metrics by placement | P1 |

#### Reporting & Export

| ID | Story | Acceptance Criteria | Priority |
|----|-------|---------------------|----------|
| US-009 | As a client, I want to export data to CSV for my own analysis | Given I'm viewing any data table, when I click Export CSV, then a file downloads with all visible data | P0 |
| US-010 | As a client, I want to download a PDF report of my dashboard | Given I'm on the dashboard, when I click Export PDF, then a formatted report downloads | P1 |
| US-011 | As a client, I want to receive automated weekly reports via email | Given I've configured email reports, when Sunday arrives, then I receive a PDF report in my inbox | P1 |

#### Alerts & Notifications

| ID | Story | Acceptance Criteria | Priority |
|----|-------|---------------------|----------|
| US-012 | As a client, I want to be notified if my spend is pacing behind/ahead | Given I've set pacing thresholds, when spend deviates by >20%, then I receive an email alert | P1 |
| US-013 | As a client, I want to see unusual performance changes highlighted | Given there's an anomaly, when I view the dashboard, then the affected metric shows an alert indicator | P2 |

### 9.2 Agency Admin User Stories

| ID | Story | Acceptance Criteria | Priority |
|----|-------|---------------------|----------|
| US-014 | As an agency admin, I want to create new client accounts | Given I'm logged in as admin, when I fill out the new client form, then a new tenant is created with the specified details | P0 |
| US-015 | As an agency admin, I want to invite client users | Given I'm on the client's settings page, when I enter an email and role, then an invitation is sent | P0 |
| US-016 | As an agency admin, I want to connect data sources for a client | Given I'm setting up a new client, when I authenticate with their ad accounts, then data begins syncing | P0 |
| US-017 | As an agency admin, I want to see all clients' high-level performance | Given I'm on the admin dashboard, when I view the client overview, then I see summary KPIs for all clients | P1 |
| US-018 | As an agency admin, I want to add annotations to explain performance changes | Given I'm viewing a client's dashboard, when I add an annotation for a date, then it appears on the timeline | P2 |

---

## 10. Technical Requirements

### 10.1 Technology Stack

#### Frontend
| Component | Technology | Rationale |
|-----------|------------|-----------|
| Framework | Next.js 14 (React) | SSR for performance, API routes, great DX |
| Styling | Tailwind CSS | Rapid development, consistent design |
| Charts | Chart.js + react-chartjs-2 | Full-featured, performant, well-documented |
| Data Tables | TanStack Table (React Table) | Sorting, filtering, pagination, virtualization |
| State Management | Zustand | Lightweight, simple, performant |
| Forms | React Hook Form + Zod | Type-safe validation |
| HTTP Client | Axios | Interceptors, retry logic |

#### Backend
| Component | Technology | Rationale |
|-----------|------------|-----------|
| API Server | Node.js + Express / NestJS | TypeScript support, scalable, familiar ecosystem |
| Database | PostgreSQL 15 | Robust, RLS support, excellent performance |
| ORM | Prisma | Type-safe queries, migrations, great DX |
| Caching | Redis | Fast in-memory cache, session storage |
| Job Queue | BullMQ | Reliable job processing, Redis-backed |
| Auth | Custom JWT + refresh tokens | Full control, security best practices |

#### Infrastructure
| Component | Technology | Rationale |
|-----------|------------|-----------|
| Hosting | Vercel (Frontend) + Railway/Render (Backend) | Easy deployment, auto-scaling |
| Database Hosting | Supabase / AWS RDS | Managed PostgreSQL, backups, RLS support |
| CDN | Vercel Edge / CloudFlare | Static asset caching, global distribution |
| Monitoring | Datadog / New Relic | APM, logs, metrics, alerting |
| CI/CD | GitHub Actions | Automated testing and deployment |

### 10.2 Non-Functional Requirements

#### Performance
| Metric | Target | Measurement |
|--------|--------|-------------|
| Page Load Time | < 2 seconds | Lighthouse, RUM |
| API Response Time (p95) | < 500ms | APM |
| Dashboard Render Time | < 1 second | Client-side metrics |
| Time to Interactive | < 3 seconds | Lighthouse |

#### Scalability
| Metric | Target |
|--------|--------|
| Concurrent Users | 500+ |
| Data Volume | 100M+ rows |
| Tenants | 200+ clients |

#### Availability
| Metric | Target |
|--------|--------|
| Uptime | 99.9% |
| Recovery Time Objective (RTO) | < 1 hour |
| Recovery Point Objective (RPO) | < 24 hours |

#### Security
- **Encryption**: TLS 1.3 for data in transit, AES-256 for data at rest
- **Authentication**: JWT with RS256 signing, bcrypt password hashing
- **Authorization**: Row-level security, RBAC
- **Compliance**: GDPR-ready (data deletion, export capabilities)
- **Audit**: All data access logged with user context

### 10.3 API Design

#### RESTful Endpoints

```
Authentication
POST   /api/auth/login           # Login with email/password
POST   /api/auth/logout          # Logout (invalidate tokens)
POST   /api/auth/refresh         # Refresh access token
POST   /api/auth/forgot-password # Initiate password reset
POST   /api/auth/reset-password  # Complete password reset

Dashboard
GET    /api/dashboard/summary    # KPI summary for tenant
GET    /api/dashboard/trends     # Time-series data for charts
GET    /api/dashboard/channels   # Channel distribution data

Campaigns
GET    /api/campaigns            # List campaigns (paginated, filterable)
GET    /api/campaigns/:id        # Campaign detail
GET    /api/campaigns/:id/metrics # Campaign time-series metrics

Reports
GET    /api/reports              # List scheduled reports
POST   /api/reports              # Create scheduled report
DELETE /api/reports/:id          # Delete scheduled report
GET    /api/reports/export/pdf   # Generate PDF export
GET    /api/reports/export/csv   # Generate CSV export

Alerts
GET    /api/alerts               # List alerts for tenant
POST   /api/alerts               # Create alert rule
PUT    /api/alerts/:id           # Update alert rule
DELETE /api/alerts/:id           # Delete alert rule

Admin (Agency Only)
GET    /api/admin/tenants        # List all tenants
POST   /api/admin/tenants        # Create new tenant
GET    /api/admin/tenants/:id    # Tenant details
PUT    /api/admin/tenants/:id    # Update tenant
GET    /api/admin/users          # List all users
POST   /api/admin/users/invite   # Invite user to tenant
```

#### Query Parameters (Common)
```
?start_date=2024-01-01
&end_date=2024-01-31
&channel=meta|programmatic|all
&campaign_ids=abc,def,ghi
&page=1
&limit=25
&sort=spend
&order=desc
```

### 10.4 Database Schema (Core Tables)

```sql
-- Core tenant and user tables (see Section 6)

-- Data source connections
CREATE TABLE data_sources (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID REFERENCES tenants(id),
    platform ENUM('meta', 'ttd', 'dv360', 'amazon') NOT NULL,
    account_id VARCHAR(255) NOT NULL,
    account_name VARCHAR(500),
    credentials JSONB, -- Encrypted OAuth tokens
    status ENUM('active', 'error', 'disconnected') DEFAULT 'active',
    last_sync_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Pre-computed daily aggregations for fast dashboard loads
CREATE TABLE daily_aggregates (
    id SERIAL PRIMARY KEY,
    tenant_id UUID REFERENCES tenants(id),
    date DATE NOT NULL,
    channel ENUM('meta', 'programmatic') NOT NULL,
    total_spend DECIMAL(12,2),
    total_impressions BIGINT,
    total_clicks BIGINT,
    total_conversions INTEGER,
    avg_ctr DECIMAL(8,6),
    avg_cpc DECIMAL(8,2),
    avg_cpa DECIMAL(8,2),
    created_at TIMESTAMP DEFAULT NOW(),
    UNIQUE(tenant_id, date, channel)
);

-- Alert configurations
CREATE TABLE alert_rules (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID REFERENCES tenants(id),
    created_by UUID REFERENCES users(id),
    metric VARCHAR(50) NOT NULL,
    condition ENUM('gt', 'lt', 'change_pct') NOT NULL,
    threshold DECIMAL(12,2) NOT NULL,
    notification_channels JSONB, -- ['email', 'slack']
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Alert history
CREATE TABLE alert_events (
    id SERIAL PRIMARY KEY,
    alert_rule_id UUID REFERENCES alert_rules(id),
    tenant_id UUID REFERENCES tenants(id),
    triggered_at TIMESTAMP DEFAULT NOW(),
    metric_value DECIMAL(12,2),
    notification_sent_at TIMESTAMP,
    acknowledged_at TIMESTAMP
);

-- Scheduled reports
CREATE TABLE scheduled_reports (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID REFERENCES tenants(id),
    created_by UUID REFERENCES users(id),
    name VARCHAR(255) NOT NULL,
    frequency ENUM('daily', 'weekly', 'monthly') NOT NULL,
    day_of_week INTEGER, -- 0-6 for weekly
    day_of_month INTEGER, -- 1-31 for monthly
    recipients JSONB NOT NULL, -- Array of email addresses
    report_config JSONB, -- What to include
    last_sent_at TIMESTAMP,
    next_scheduled_at TIMESTAMP,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Indexes for common queries
CREATE INDEX idx_programmatic_tenant_date ON programmatic_daily_metrics(tenant_id, date);
CREATE INDEX idx_meta_tenant_date ON meta_daily_metrics(tenant_id, date);
CREATE INDEX idx_daily_agg_tenant_date ON daily_aggregates(tenant_id, date);
```

---

## 11. Competitive Analysis

### 11.1 Market Overview

The marketing agency reporting and dashboard market is mature, with several established players serving agencies of various sizes. Key trends include:

- **AI-powered insights**: Automated analysis and recommendations
- **White-labeling**: Agencies want their brand front and center
- **Multi-platform integration**: Connecting 50+ marketing data sources
- **Self-service**: Reducing reliance on technical resources
- **Real-time data**: Moving from weekly to daily or even hourly updates

### 11.2 Competitor Deep Dive

---

#### 1. AgencyAnalytics
**Website:** https://agencyanalytics.com

**Overview:**
The leading all-in-one reporting platform built specifically for marketing agencies. Known for its breadth of integrations and agency-focused features.

**Key Features:**
- 80+ native integrations (Google Ads, Meta, SEO tools, etc.)
- Client portal with branded login
- Automated report scheduling (PDF email)
- White-labeling (custom domain, logo, colors)
- Custom metrics and goals
- SEO rank tracking (add-on)
- AI Summary feature for reports

**Dashboard Screenshot Description:**
Clean, modern interface with KPI cards at top, multi-colored charts below. White sidebar navigation. Supports dark/light themes. Strong emphasis on visual customization with client logos prominent.

**Pricing:**
| Plan | Price | Clients | Key Features |
|------|-------|---------|--------------|
| Freelancer | $59/mo | 5 | 5 staff, basic features |
| Agency | $179/mo | 10 | Unlimited staff, AI, full branding |
| Agency Pro | $349/mo | 15 | Benchmarks, forecasting, API |
| Enterprise | Custom | Custom | SSO, dedicated support |

*Additional clients: $20/mo each*

**Strengths:**
- Purpose-built for agencies
- Excellent integration library
- Strong white-label options
- Competitive pricing

**Weaknesses:**
- Can be complex for simpler use cases
- Some advanced features require higher tiers
- Limited real-time data (typically T-1)

**Fit for Freedom & Coffee:**
Strong competitor model. Their feature set closely matches our requirements. Consider their pricing structure as benchmark.

---

#### 2. Databox
**Website:** https://databox.com

**Overview:**
A business analytics platform that connects data from multiple sources into one dashboard. Popular with both agencies and in-house teams.

**Key Features:**
- 130+ cloud integrations
- Pre-built dashboard templates
- TV mode for office displays
- AI performance summaries
- Goal tracking and forecasting
- Mobile app
- Benchmark data
- Agency-specific features (client accounts, white-label)

**Dashboard Screenshot Description:**
Widget-based dashboard with a variety of visualization types. Emphasis on "Databoards" that can mix metrics from different sources. Clean white aesthetic with colorful charts.

**Pricing:**
- **Free**: Limited features and data sources
- **Starter**: ~$59/mo
- **Professional**: ~$169/mo
- **Growth**: ~$339/mo
- **Premium**: Custom pricing

*Pricing based on data sources and features*

**Strengths:**
- Very polished UI/UX
- Strong mobile experience
- Excellent template library
- Good free tier for trying

**Weaknesses:**
- Pricing can escalate quickly with many data sources
- Less agency-specific than AgencyAnalytics
- Some advanced features gated to higher tiers

**Fit for Freedom & Coffee:**
Good reference for UI polish and feature prioritization. Their "Databoard" concept is worth studying.

---

#### 3. Whatagraph
**Website:** https://whatagraph.com

**Overview:**
A marketing data platform focused on visual reporting and data management. Strong emphasis on report aesthetics and ease of use.

**Key Features:**
- Cross-channel reporting
- Beautiful pre-built templates
- AI-powered report creation (Whatagraph IQ)
- White-label customization
- Automated email reports with PDF
- Data transfer to BigQuery/Looker Studio
- Source data blending

**Dashboard Screenshot Description:**
Highly visual, colorful reports that look like designed presentations. Strong focus on aesthetic appeal. Pre-built themes for quick branding.

**Pricing:**
| Plan | Price | Source Credits | Key Features |
|------|-------|----------------|--------------|
| Free | €0 | 5 | Basic, limited integrations |
| Start | €199/mo | 20 | Advanced integrations, white-label |
| Boost | €499/mo | 60 | Custom branding, AI IQ+ |
| Max | Custom | 100+ | SSO, priority support |

**Strengths:**
- Best-in-class report design/aesthetics
- Strong AI features
- Good data blending capabilities

**Weaknesses:**
- Higher price point
- Credit-based pricing can be confusing
- Less focus on real-time dashboards vs reports

**Fit for Freedom & Coffee:**
Good model for report aesthetics. Their IQ AI feature is innovative.

---

#### 4. DashThis
**Website:** https://dashthis.com

**Overview:**
A straightforward reporting tool known for its simplicity and ease of use. Popular with smaller agencies and freelancers.

**Key Features:**
- Drag-and-drop dashboard builder
- Unlimited integrations and data sources (per plan)
- Preset dashboard templates
- White-labeled dashboards
- Automated email dispatch
- AI Insights (analysis of performance)
- CSV upload for custom data

**Dashboard Screenshot Description:**
Clean, no-frills interface. Emphasis on simplicity over visual flourish. Widget-based editor is intuitive. Good for users who aren't technical.

**Pricing:**
| Plan | Price | Dashboards | Key Features |
|------|-------|------------|--------------|
| Individual | $42/mo | 3 | Basic features |
| Professional | $135/mo | 10 | White-label, custom themes |
| Business | $264/mo | 25 | Priority support |
| Standard | $409/mo | 50 | All features |

*Unlimited users, integrations, data sources on all plans*

**Strengths:**
- Very simple pricing (dashboard-based)
- Easy to use
- Good value at lower tiers
- Unlimited data sources

**Weaknesses:**
- Less sophisticated visualizations
- Fewer advanced analytics features
- Limited customization compared to competitors

**Fit for Freedom & Coffee:**
Good model for simplicity and pricing transparency. Their dashboard-based pricing is clear.

---

#### 5. Klipfolio
**Website:** https://klipfolio.com

**Overview:**
A mature dashboard and BI tool with powerful data manipulation capabilities. Two products: Klips (traditional dashboards) and PowerMetrics (modern metrics platform).

**Key Features:**
- 130+ data integrations
- Powerful formula language for custom calculations
- Published links for sharing
- White-label bundle available
- Multi-language support
- Spreadsheet-like data manipulation
- TV dashboard streaming

**Dashboard Screenshot Description:**
More technical/BI-focused interface. Powerful but steeper learning curve. Supports complex visualizations and custom calculations.

**Pricing:**
| Plan | Price | Dashboards | Refresh Rate |
|------|-------|------------|--------------|
| Base | ~$50/mo | 3 | 4 hours |
| Grow | ~$80/mo | 10 | 1 hour |
| Team | ~$150/mo | 20 | 15 min |
| Team+ | ~$300/mo | 40 | Real-time |

*Add-ons: White-label bundle, custom domain, etc.*

**Strengths:**
- Very powerful data manipulation
- Flexible for complex use cases
- Good for technical users

**Weaknesses:**
- Steeper learning curve
- Less polished UI than newer competitors
- Not as agency-focused

**Fit for Freedom & Coffee:**
Less applicable as a direct model due to different target audience, but formula/calculation features are worth noting.

---

#### 6. Swydo
**Website:** https://swydo.com

**Overview:**
A reporting and monitoring tool built for marketing agencies. Known for simple pricing and good value.

**Key Features:**
- AI-powered report summaries
- Unlimited users, dashboards, and reports
- 32+ integrations
- Custom metrics and KPIs
- White-labeling and branding
- Multi-language reports (14 languages)
- Client portal access

**Dashboard Screenshot Description:**
Clean, professional interface. Good balance between features and simplicity. Strong emphasis on automated reporting workflows.

**Pricing:**
- **Base**: €69/mo (includes 10 data sources)
- **Additional sources**: €4.50 each (11-100), €3.00 (101-500), €2.00 (501+)

*Simple, transparent volume pricing*

**Strengths:**
- Simple, transparent pricing
- Good feature set for the price
- Multi-language support
- All features included in one plan

**Weaknesses:**
- Fewer integrations than some competitors
- Less visual polish
- Smaller company/ecosystem

**Fit for Freedom & Coffee:**
Excellent pricing model to study. Their "all features included" approach is refreshing.

---

#### 7. NinjaCat
**Website:** https://ninjacat.io

**Overview:**
Enterprise-grade marketing data platform with AI capabilities. Targets larger agencies and marketing organizations.

**Key Features:**
- Data Cloud (ETL for marketing)
- AI Agents for automated insights
- Generative data apps
- World-class report customization
- Enterprise security (SSO, etc.)
- Custom integrations

**Dashboard Screenshot Description:**
Enterprise aesthetic with sophisticated data visualizations. Heavy emphasis on AI and automation. Designed for large-scale operations.

**Pricing:**
- **Custom/Enterprise**: Contact sales only
- Targets 150+ enterprise marketing organizations

**Strengths:**
- Most advanced AI capabilities
- Enterprise-grade
- Highly customizable

**Weaknesses:**
- Expensive (enterprise pricing)
- Overkill for smaller agencies
- Not transparent pricing

**Fit for Freedom & Coffee:**
Aspirational model for advanced features (AI agents, data cloud). Not a direct competitor at current scale.

---

### 11.3 Competitive Positioning Matrix

| Feature | AgencyAnalytics | Databox | Whatagraph | DashThis | Klipfolio | Swydo | NinjaCat | **F&C Dashboard** |
|---------|-----------------|---------|------------|----------|-----------|-------|----------|-------------------|
| **Agency Focus** | ★★★★★ | ★★★☆☆ | ★★★★☆ | ★★★★☆ | ★★☆☆☆ | ★★★★★ | ★★★★★ | ★★★★★ |
| **Ease of Use** | ★★★★☆ | ★★★★★ | ★★★★☆ | ★★★★★ | ★★★☆☆ | ★★★★☆ | ★★★☆☆ | ★★★★★ |
| **Integration Breadth** | ★★★★★ | ★★★★★ | ★★★★☆ | ★★★★☆ | ★★★★★ | ★★★☆☆ | ★★★★★ | ★★☆☆☆ |
| **White-Labeling** | ★★★★★ | ★★★★☆ | ★★★★★ | ★★★★☆ | ★★★★☆ | ★★★★☆ | ★★★★★ | ★★★★★ |
| **AI Features** | ★★★★☆ | ★★★★☆ | ★★★★★ | ★★★☆☆ | ★★☆☆☆ | ★★★★☆ | ★★★★★ | ★★★☆☆ |
| **Price/Value** | ★★★★☆ | ★★★☆☆ | ★★★☆☆ | ★★★★★ | ★★★★☆ | ★★★★★ | ★★☆☆☆ | ★★★★★ |
| **Customization** | ★★★★☆ | ★★★☆☆ | ★★★★☆ | ★★★☆☆ | ★★★★★ | ★★★☆☆ | ★★★★★ | ★★★★☆ |

### 11.4 Differentiation Strategy

Freedom & Coffee's dashboard can differentiate by:

1. **Specialization**: Focus only on programmatic + Meta (do it exceptionally well)
2. **Simplicity**: Don't try to be everything — be the clearest, easiest dashboard
3. **Transparency**: Agency-client trust through radical transparency
4. **Cost**: No per-seat or per-client fees for our clients
5. **Speed**: Faster daily updates than competitors (aim for 6am availability)
6. **Service**: Combination of dashboard + agency expertise

---

## 12. MVP Scope vs Future Features

### 12.1 MVP (Phase 1) — Target: 12 Weeks

**Goal:** Deliver a functional dashboard that clients can use daily to view their campaign performance.

#### MVP Features

| Feature | Priority | Effort | Notes |
|---------|----------|--------|-------|
| **Authentication** | | | |
| Email/password login | P0 | M | Core requirement |
| Password reset | P0 | S | Core requirement |
| JWT token management | P0 | M | Security foundation |
| **Dashboard Home** | | | |
| KPI summary cards (5 metrics) | P0 | M | Spend, Impr, Clicks, Conv, ROAS |
| Date range filter (presets) | P0 | S | Last 7/14/30 days |
| Performance trend line chart | P0 | M | Primary visualization |
| Channel split donut chart | P1 | S | Quick channel comparison |
| **Campaign List** | | | |
| Campaigns table | P0 | M | Sortable, basic filters |
| Campaign detail page | P0 | L | Day-by-day metrics |
| **Data Integration** | | | |
| Meta API integration | P0 | L | Primary data source |
| One programmatic source (TTD or DV360) | P0 | L | Primary data source |
| Daily ETL pipeline | P0 | L | 6am refresh |
| **Export** | | | |
| CSV export | P0 | S | Basic data export |
| **Admin** | | | |
| Create tenant | P0 | M | Onboarding new clients |
| Invite user | P0 | S | User provisioning |
| Connect data sources | P0 | M | OAuth flows |

**MVP Non-Goals (Explicitly Excluded):**
- Automated PDF reports
- Alerts/notifications
- AI features
- Multiple programmatic sources
- Advanced analytics
- Mobile-optimized design

#### MVP Success Criteria
- 5 pilot clients successfully using dashboard
- <3 second page load times
- 95%+ data accuracy vs source platforms
- Zero security incidents

### 12.2 Phase 2 — Target: 8 Weeks After MVP

| Feature | Priority | Effort |
|---------|----------|--------|
| PDF report export | P1 | M |
| Scheduled email reports (weekly) | P1 | L |
| Custom date range picker | P1 | S |
| Period comparison | P1 | M |
| Additional programmatic sources | P1 | L |
| User role management (admin vs viewer) | P1 | M |
| Basic alerts (spend pacing) | P2 | M |
| Campaign annotations | P2 | S |

### 12.3 Phase 3 — Target: 8 Weeks After Phase 2

| Feature | Priority | Effort |
|---------|----------|--------|
| Mobile-responsive design | P2 | L |
| Advanced alerts (anomaly detection) | P2 | L |
| Slack notifications | P2 | M |
| Custom dashboards (widget configuration) | P2 | L |
| AI-powered insights/summaries | P3 | L |
| Benchmark data | P3 | L |
| White-label customization (colors, domain) | P2 | M |

### 12.4 Future Roadmap (6-12 Months)

| Feature | Business Value |
|---------|----------------|
| SSO/SAML integration | Enterprise client requirement |
| API access for clients | Power user enablement |
| Real-time data (hourly refresh) | Competitive advantage |
| Advanced attribution modeling | Deeper insights |
| Creative performance analysis | Strategic value |
| Forecasting & goal tracking | Proactive optimization |
| Multi-language support | International clients |

### 12.5 Build vs Buy Analysis

| Approach | Pros | Cons | Recommendation |
|----------|------|------|----------------|
| **Build Custom** | Full control, differentiation, no per-client costs, tailored to workflow | Higher upfront investment, maintenance burden, longer time to market | ✅ **Recommended for MVP** |
| **White-Label Existing** (e.g., AgencyAnalytics) | Fast deployment, proven solution, less maintenance | Ongoing costs per client, less differentiation, dependency | Consider for rapid scaling |
| **Hybrid** | Quick MVP via existing tool, custom build for differentiation | Complexity, migration costs | Not recommended initially |

**Rationale for Build:**
- Core differentiator for agency
- No recurring per-client costs
- Full customization for client experience
- Long-term cost efficiency
- Learning and capability building

---

## 13. Success Metrics

### 13.1 Key Performance Indicators (KPIs)

#### User Adoption Metrics

| Metric | Target (MVP) | Target (6 Month) | Measurement |
|--------|--------------|------------------|-------------|
| Client Activation Rate | 80% | 95% | % of clients who log in within 7 days of invite |
| Weekly Active Users | 60% | 75% | % of users logging in weekly |
| Daily Active Users | 25% | 40% | % of users logging in daily |
| Session Duration | 3+ min | 5+ min | Avg time spent per session |
| Pages per Session | 3+ | 5+ | Depth of engagement |

#### Business Impact Metrics

| Metric | Target (MVP) | Target (6 Month) | Measurement |
|--------|--------------|------------------|-------------|
| Reporting Time Saved | 50% | 70% | Hours spent on manual reporting |
| Client Satisfaction (NPS) | 40+ | 60+ | Quarterly NPS survey |
| Client Retention | Baseline | +10% | Year-over-year retention |
| Support Tickets (Reporting) | -30% | -60% | Tickets related to data requests |
| Account Manager Capacity | +20% | +50% | Clients per AM |

#### Technical Performance Metrics

| Metric | Target | Alerting Threshold |
|--------|--------|-------------------|
| Dashboard Load Time (p95) | <2s | >3s |
| API Response Time (p95) | <500ms | >1s |
| Data Freshness | <8 hours | >12 hours |
| Uptime | 99.9% | <99.5% |
| Error Rate | <0.1% | >1% |
| ETL Pipeline Success | 99% | <95% |

#### Data Quality Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Data Accuracy | 99.5%+ | Spot-check vs source platforms |
| Missing Data Rate | <1% | Records with null critical fields |
| Duplicate Rate | <0.1% | Duplicate detection queries |

### 13.2 User Feedback Loops

#### Quantitative
- In-app analytics (Mixpanel/Amplitude)
- Feature usage tracking
- Funnel analysis (login → key action)
- Error tracking (Sentry)

#### Qualitative
- Quarterly NPS surveys
- In-app feedback widget
- Client call feedback (Account Managers)
- Feature request tracking

### 13.3 Success Milestones

| Milestone | Timeline | Criteria |
|-----------|----------|----------|
| MVP Launch | Week 12 | 5 pilot clients onboarded |
| Product-Market Fit Signal | Week 20 | >40% WAU, NPS >30 |
| Full Rollout | Week 24 | All clients onboarded |
| Reporting Hours Halved | Week 30 | 50% reduction measured |
| Phase 2 Complete | Week 32 | PDF reports, alerts live |

---

## Appendix

### A. Glossary

| Term | Definition |
|------|------------|
| CTR | Click-Through Rate (Clicks / Impressions) |
| CPC | Cost Per Click (Spend / Clicks) |
| CPA | Cost Per Acquisition (Spend / Conversions) |
| ROAS | Return on Ad Spend (Revenue / Spend) |
| CPM | Cost Per Mille (Cost per 1,000 impressions) |
| DSP | Demand-Side Platform |
| ETL | Extract, Transform, Load |
| JWT | JSON Web Token |
| RLS | Row-Level Security |
| TTD | The Trade Desk |
| DV360 | Display & Video 360 (Google) |

### B. Reference Documents
- Meta Marketing API Documentation: https://developers.facebook.com/docs/marketing-apis
- The Trade Desk API Documentation: (Partner portal)
- DV360 Reporting API: https://developers.google.com/bid-manager/api

### C. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-01-26 | Product Team | Initial draft |

---

*This document is maintained by the Freedom & Coffee Product Team. For questions or feedback, contact the product owner.*
