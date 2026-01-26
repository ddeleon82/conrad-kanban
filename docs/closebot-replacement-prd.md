# Product Requirements Document: ConvoBot
## AI-Powered Multi-Channel Conversation Management Platform

**Version:** 1.0  
**Date:** January 26, 2026  
**Author:** Freedom & Coffee Engineering  
**Status:** Draft  

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Problem Statement](#2-problem-statement)
3. [Target Users](#3-target-users)
4. [Core Features](#4-core-features)
5. [GoHighLevel Integration Architecture](#5-gohighlevel-integration-architecture)
6. [Conversational Programming Interface Design](#6-conversational-programming-interface-design)
7. [Multi-Channel Message Flow](#7-multi-channel-message-flow)
8. [User Stories](#8-user-stories)
9. [Technical Requirements](#9-technical-requirements)
10. [MVP Scope vs Future Features](#10-mvp-scope-vs-future-features)
11. [Competitive Analysis](#11-competitive-analysis)
12. [Success Metrics](#12-success-metrics)

---

## 1. Executive Summary

### 1.1 Vision

ConvoBot is an AI-powered conversation management platform designed to replace CloseBot for Freedom & Coffee agency clients. The platform enables automated, intelligent multi-channel follow-up conversations across SMS, email, and social media—all unified through GoHighLevel (GHL) integration.

### 1.2 Key Differentiator

**Conversational Programming:** Unlike competitors that require technical flow builders or prompt engineering, ConvoBot allows users to configure bot behavior through natural conversation. Users simply tell the bot how they want it to behave, what personality to adopt, and what outcomes to achieve—the system translates this into working automation.

### 1.3 Core Value Proposition

- **For Freedom & Coffee:** A proprietary solution that reduces dependency on third-party tools while increasing margins and control
- **For Agency Clients:** 24/7 intelligent lead engagement that books appointments, qualifies prospects, and nurtures relationships without human intervention
- **For End Users (Leads/Customers):** Natural, helpful conversations that feel human and provide value

### 1.4 Business Goals

| Goal | Target | Timeline |
|------|--------|----------|
| Replace CloseBot for existing clients | 100% migration | 90 days post-launch |
| Reduce per-client tool costs | 40-60% reduction | Immediate |
| Increase booking rates vs CloseBot | 15% improvement | 6 months |
| New revenue stream (SaaS offering) | $25K MRR | 12 months |

---

## 2. Problem Statement

### 2.1 Current Pain Points

**For Freedom & Coffee:**
1. **Dependency on CloseBot:** Critical business functionality relies on a third-party tool with unpredictable pricing and roadmap
2. **Limited Customization:** CloseBot's flow builder constrains what's possible for complex client needs
3. **Margin Compression:** Rebilling CloseBot at markup leaves thin margins compared to owning the solution
4. **Support Burden:** When CloseBot has issues, Freedom & Coffee bears the client relationship burden without control to fix

**For Agency Clients:**
1. **Configuration Complexity:** Building effective AI flows requires technical expertise most business owners lack
2. **Brittle Conversations:** Pre-defined flows break down when conversations go "off-script"
3. **Poor Personalization:** Generic bot responses feel robotic and damage brand trust
4. **Channel Fragmentation:** Managing different behaviors across SMS, email, and social creates inconsistency

**For Leads/Customers:**
1. **Obvious Bot Detection:** Current solutions feel artificial, leading to disengagement
2. **Frustrating Loops:** Rigid flows trap users in repetitive exchanges
3. **Lack of Context:** Bots don't remember previous interactions or adapt accordingly

### 2.2 Root Cause Analysis

The fundamental issue is that existing solutions treat conversation automation as a **programming problem** (flows, states, conditions) rather than a **communication problem** (goals, personality, context). This forces non-technical users to think like developers, while simultaneously constraining what's possible.

### 2.3 Opportunity

By leveraging modern LLMs with a conversational configuration interface, we can create a system that:
- Is easier to set up than competitors
- Produces more natural conversations
- Handles edge cases gracefully
- Gives Freedom & Coffee ownership and control

---

## 3. Target Users

### 3.1 User Personas

#### Primary: Agency Administrator (Freedom & Coffee Team)

| Attribute | Description |
|-----------|-------------|
| **Name** | Sarah, Account Manager |
| **Role** | Sets up and manages ConvoBot for multiple clients |
| **Technical Level** | Moderate - comfortable with GHL, not a developer |
| **Goals** | Quick client onboarding, minimal ongoing maintenance, prove ROI |
| **Pain Points** | Spending hours configuring flows, client complaints about bot quality |
| **Success Metric** | Time from client signup to live bot < 2 hours |

#### Secondary: Business Owner (Agency Client)

| Attribute | Description |
|-----------|-------------|
| **Name** | Mike, Roofing Company Owner |
| **Role** | End client using ConvoBot through their GHL account |
| **Technical Level** | Low - uses GHL for CRM, doesn't understand automation |
| **Goals** | More booked appointments, less time on phone, happy customers |
| **Pain Points** | Leads go cold, can't respond fast enough, hiring is expensive |
| **Success Metric** | Booked appointments increased 30% |

#### Tertiary: Lead/Customer (End Recipient)

| Attribute | Description |
|-----------|-------------|
| **Name** | Jennifer, Homeowner |
| **Role** | Received marketing, interested in service |
| **Technical Level** | Varies |
| **Goals** | Get information quickly, book if interested, not be annoyed |
| **Pain Points** | Spam, pushy sales, unhelpful automated responses |
| **Success Metric** | Positive sentiment, completed booking |

### 3.2 User Segments by Industry

| Industry | Common Use Cases | Special Requirements |
|----------|------------------|---------------------|
| Home Services (HVAC, Roofing, Plumbing) | Lead qualification, appointment booking | Emergency handling, service area validation |
| Real Estate | Buyer/seller qualification, showing scheduling | MLS integration, multi-agent routing |
| Healthcare/Dental | Appointment booking, patient follow-up | HIPAA considerations, insurance verification |
| Legal | Case qualification, consultation booking | Conflict checking, urgency assessment |
| Fitness/Wellness | Membership inquiries, class booking | Availability checking, promo handling |

---

## 4. Core Features

### 4.1 Conversational Bot Configuration

#### 4.1.1 Natural Language Setup

Users configure bot behavior through conversation, not forms or flow builders:

```
User: "I want my bot to be friendly but professional. We're a dental office 
      so it should be helpful about common questions like insurance and 
      services. Main goal is booking appointments."

ConvoBot: "Got it! I'll be friendly and professional, knowledgeable about 
          dental topics. My main goal will be getting appointments booked. 
          
          A few quick questions:
          - What's your office name?
          - What are your hours?
          - Any services you specialize in that I should highlight?"
```

#### 4.1.2 Behavior Specification

| Behavior Aspect | Configuration Method | Example |
|----------------|---------------------|---------|
| **Personality** | Natural language description | "Warm, casual, uses emojis occasionally" |
| **Knowledge** | Document upload + conversation | Upload FAQ PDF, discuss common objections |
| **Goals** | Priority-ordered list via chat | "First qualify budget, then book appointment" |
| **Guardrails** | Explicit instructions | "Never discuss competitor pricing" |
| **Handoff Rules** | Scenario description | "If someone is angry, get a human immediately" |

#### 4.1.3 Live Behavior Modification

```
User: "Leads are complaining the bot is too pushy about booking"

ConvoBot: "I'll dial back the appointment pressure. Instead of suggesting 
          booking every message, I'll wait until they've asked at least 
          2 questions or expressed clear interest. Sound good?"

User: "Yes, and add more value before asking to book"

ConvoBot: "Perfect. I'll share a helpful tip or answer their question 
          thoroughly before mentioning availability. Updated!"
```

### 4.2 Multi-Channel Conversation Management

#### 4.2.1 Supported Channels

| Channel | Integration Method | Special Considerations |
|---------|-------------------|----------------------|
| **SMS** | GHL native | Character limits, MMS support |
| **Email** | GHL native | Formatting, subject lines, threading |
| **Facebook Messenger** | GHL native | Quick replies, media support |
| **Instagram DM** | GHL native | Story mentions, media handling |
| **Google Business Chat** | GHL native | Business context |
| **WhatsApp** | GHL (if available) | Template requirements |
| **Web Chat** | Custom widget | Real-time, typing indicators |

#### 4.2.2 Channel-Adaptive Responses

The same conversation intent adapts to channel norms:

| Channel | Response Style |
|---------|---------------|
| **SMS** | Short, punchy, emoji-light, 2-3 sentences max |
| **Email** | Professional formatting, proper greeting/signature |
| **Messenger** | Casual, quick replies, appropriate emoji |
| **Instagram** | Trendy, visual references, younger tone |

#### 4.2.3 Cross-Channel Continuity

Conversations maintain context across channels:

```
[SMS] Lead: "What services do you offer?"
[Bot]: "We do full roof replacements, repairs, and inspections! 
       What brings you to us today?"

[Hours later, via Facebook]
Lead: "Hey I texted earlier about roofing"
[Bot]: "Hey! Yes, I remember - you were asking about our services. 
       Were you thinking repair or full replacement?"
```

### 4.3 Intelligent Conversation Handling

#### 4.3.1 Goal-Oriented Dialogue

Rather than following rigid flows, ConvoBot pursues configured goals while adapting to conversation context:

**Goals (configurable per client):**
1. Qualify the lead (budget, timeline, need)
2. Provide helpful information
3. Book appointment or hand off to human
4. Collect contact information if missing

**Adaptive Pursuit:**
```
Scenario A: Lead immediately wants to book
Bot: [Skips qualification, goes straight to booking]

Scenario B: Lead has many questions
Bot: [Answers thoroughly, builds rapport, then gently moves toward booking]

Scenario C: Lead seems hesitant
Bot: [Provides social proof, addresses objections, offers low-commitment next step]
```

#### 4.3.2 Context Understanding

| Context Type | Detection Method | Response Adaptation |
|--------------|-----------------|---------------------|
| **Urgency** | Keywords, punctuation, time expressions | Expedited handling, immediate callback offer |
| **Sentiment** | Tone analysis | Empathy, de-escalation, human handoff |
| **Intent** | Semantic understanding | Skip unnecessary questions, direct routing |
| **History** | Previous conversation lookup | Personalized references, no redundant questions |

#### 4.3.3 Objection Handling

Pre-configured responses to common objections, customizable per client:

| Objection Type | Default Handling | Customization |
|---------------|-----------------|---------------|
| "Too expensive" | Value reframe, financing options, ROI | Client-specific pricing responses |
| "Just looking" | Offer value, low-pressure follow-up | Industry-specific nurture |
| "Bad timing" | Schedule future follow-up, stay top of mind | Seasonal considerations |
| "Using competitor" | Differentiation, satisfaction check | Competitive intel responses |
| "Need to think" | Offer more info, address concerns | Decision-support materials |

### 4.4 Appointment Booking

#### 4.4.1 Calendar Integration

- Native integration with GHL calendar
- Support for multiple team members/resources
- Availability checking in real-time
- Buffer time and booking rules honored

#### 4.4.2 Smart Scheduling

```
Lead: "I need someone to look at my roof"
Bot: "I'd love to get one of our specialists out to you! 
     I have availability tomorrow at 2pm or Thursday morning. 
     What works better for you?"
     
Lead: "Tomorrow is no good, I work until 5"
Bot: "No problem! How about Thursday at 5:30pm or Saturday morning?"
```

#### 4.4.3 Booking Confirmation Flow

1. Collect/confirm contact information
2. Confirm appointment details
3. Send confirmation via preferred channel
4. Add to GHL calendar
5. Trigger confirmation workflow in GHL
6. Set reminder sequence

### 4.5 Human Handoff

#### 4.5.1 Automatic Triggers

| Trigger | Action |
|---------|--------|
| Negative sentiment detected | Immediate notification + optional pause |
| Explicit request for human | Transfer with context summary |
| Conversation stalled (3+ failed exchanges) | Escalation notification |
| High-value opportunity detected | VIP notification |
| After-hours complex inquiry | Queue for morning with auto-response |

#### 4.5.2 Handoff Process

1. Bot notifies human (push notification, SMS, email)
2. Full conversation context provided
3. Bot sends "connecting you with..." message
4. Human takes over in GHL conversations
5. Bot monitors for re-engagement opportunity

#### 4.5.3 Human-in-the-Loop Learning

When humans override bot responses, the system learns:
- Which situations needed human intervention
- What response the human provided
- Whether to adjust future behavior

### 4.6 Analytics & Reporting

#### 4.6.1 Conversation Metrics

| Metric | Description | Target |
|--------|-------------|--------|
| Response Rate | % of inbound messages answered | >99% |
| Engagement Rate | % of conversations with 2+ exchanges | >70% |
| Qualification Rate | % of conversations with complete qualification | >50% |
| Booking Rate | % of qualified leads who book | >30% |
| Handoff Rate | % requiring human intervention | <15% |
| Sentiment Score | Average conversation sentiment | >0.7 |

#### 4.6.2 Business Outcomes

- Appointments booked (daily/weekly/monthly)
- Revenue attributed to ConvoBot conversations
- Cost per acquisition vs manual outreach
- Lead response time improvement
- After-hours capture rate

#### 4.6.3 Reporting Views

| View | Audience | Contents |
|------|----------|----------|
| **Agency Dashboard** | Freedom & Coffee | All clients, aggregate metrics, alerts |
| **Client Dashboard** | Business owners | Their metrics, conversation samples, trends |
| **Conversation Log** | Both | Full transcripts, searchable, filterable |

---

## 5. GoHighLevel Integration Architecture

### 5.1 Integration Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        GoHighLevel                               │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐           │
│  │   SMS    │ │  Email   │ │ Facebook │ │ Instagram│  ...      │
│  └────┬─────┘ └────┬─────┘ └────┬─────┘ └────┬─────┘           │
│       │            │            │            │                   │
│       └────────────┴────────────┴────────────┘                   │
│                           │                                       │
│                    Conversations API                              │
│                           │                                       │
└───────────────────────────┼───────────────────────────────────────┘
                            │
                     Webhooks & API
                            │
┌───────────────────────────┼───────────────────────────────────────┐
│                       ConvoBot                                     │
│                           │                                       │
│  ┌────────────────────────┴────────────────────────────┐         │
│  │              Message Router                          │         │
│  └────────────────────────┬────────────────────────────┘         │
│                           │                                       │
│  ┌────────────┬───────────┼───────────┬────────────────┐         │
│  │            │           │           │                │         │
│  ▼            ▼           ▼           ▼                ▼         │
│ Context    LLM Engine   Knowledge   Action         Analytics    │
│ Manager                  Base       Executor                     │
│                                                                   │
└───────────────────────────────────────────────────────────────────┘
```

### 5.2 GHL API Endpoints Used

#### 5.2.1 Conversations API

| Endpoint | Purpose |
|----------|---------|
| `GET /conversations` | List conversations for a location |
| `GET /conversations/{id}` | Get conversation details |
| `GET /conversations/{id}/messages` | Get message history |
| `POST /conversations/{id}/messages` | Send message |
| `POST /conversations/messages/inbound` | Process inbound (webhook) |

#### 5.2.2 Contacts API

| Endpoint | Purpose |
|----------|---------|
| `GET /contacts/{id}` | Get contact details |
| `PUT /contacts/{id}` | Update contact (qualification data) |
| `POST /contacts` | Create new contact |
| `GET /contacts/lookup` | Find contact by phone/email |

#### 5.2.3 Calendars API

| Endpoint | Purpose |
|----------|---------|
| `GET /calendars` | List available calendars |
| `GET /calendars/{id}/free-slots` | Get availability |
| `POST /calendars/{id}/appointments` | Book appointment |
| `GET /appointments/{id}` | Get appointment details |
| `PUT /appointments/{id}` | Update appointment |

#### 5.2.4 Opportunities API

| Endpoint | Purpose |
|----------|---------|
| `POST /opportunities` | Create opportunity from qualified lead |
| `PUT /opportunities/{id}` | Update pipeline stage |

### 5.3 Webhook Configuration

#### 5.3.1 Required Webhooks

| Event | Trigger | ConvoBot Action |
|-------|---------|-----------------|
| `InboundMessage` | New message received | Process and respond |
| `ContactCreate` | New contact | Initialize conversation context |
| `ContactUpdate` | Contact modified | Update context |
| `AppointmentCreate` | Booking made | Confirmation sequence |
| `AppointmentUpdate` | Booking changed | Update/notify |
| `ConversationUnread` | Conversation needs attention | Alert/prioritize |

#### 5.3.2 Webhook Security

- HMAC signature verification on all incoming webhooks
- IP allowlisting for GHL webhook sources
- Request deduplication (idempotency keys)
- Rate limiting with queue buffering

### 5.4 Authentication Flow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │     │  ConvoBot   │     │     GHL     │
│   Browser   │     │   Server    │     │    OAuth    │
└──────┬──────┘     └──────┬──────┘     └──────┬──────┘
       │                   │                   │
       │  Click Connect    │                   │
       │──────────────────>│                   │
       │                   │                   │
       │  Redirect to GHL  │                   │
       │<──────────────────│                   │
       │                   │                   │
       │  Authorize App    │                   │
       │──────────────────────────────────────>│
       │                   │                   │
       │  Callback w/Code  │                   │
       │<──────────────────────────────────────│
       │                   │                   │
       │  Exchange Code    │                   │
       │──────────────────>│                   │
       │                   │   Token Request   │
       │                   │──────────────────>│
       │                   │                   │
       │                   │   Access Token    │
       │                   │<──────────────────│
       │                   │                   │
       │  Connected!       │                   │
       │<──────────────────│                   │
       │                   │                   │
```

### 5.5 Data Synchronization

#### 5.5.1 Real-Time Sync

- Webhook-driven for all conversation events
- Sub-second response initiation
- Queue-based processing for reliability

#### 5.5.2 Periodic Sync

- Contact data refresh: Every 6 hours
- Calendar availability: Every 15 minutes
- Conversation history backfill: On connect + daily

#### 5.5.3 Error Handling

| Scenario | Handling |
|----------|----------|
| GHL API rate limit | Exponential backoff, queue messages |
| GHL outage | Queue messages, retry with backoff, alert team |
| Token expiration | Auto-refresh, re-auth flow if needed |
| Webhook delivery failure | GHL retry + manual reconciliation |

---

## 6. Conversational Programming Interface Design

### 6.1 Design Philosophy

The conversational programming interface is the core differentiator. It must feel like talking to a smart assistant, not filling out forms.

**Principles:**
1. **Natural First:** Accept natural language, don't force structure
2. **Guided Discovery:** Ask good questions to elicit complete configuration
3. **Show, Don't Tell:** Preview behavior instead of describing settings
4. **Iterative Refinement:** Easy to adjust through continued conversation
5. **Sensible Defaults:** Work well out of the box, customization optional

### 6.2 Configuration Conversation Flow

#### 6.2.1 Initial Setup Conversation

```
ConvoBot: "Hey! I'm ready to help you set up your AI assistant. 
          Let's start simple - what kind of business is this for?"

User: "A plumbing company"

ConvoBot: "Perfect! Plumbing companies usually want to:
          • Respond to emergency calls fast
          • Book service appointments
          • Answer common questions (pricing, areas served, etc.)
          
          Does that sound right, or is there something specific 
          you want to focus on?"

User: "Yes that's right, but we also do water heater installations 
      which is a big revenue driver"

ConvoBot: "Got it! I'll make sure to identify water heater opportunities 
          and treat those as high-priority leads. 
          
          What's the business called, and what personality should I have? 
          Formal and professional, or more friendly and casual?"

User: "Smith Plumbing, and we're a family business so friendly is good"

ConvoBot: "Love it! Smith Plumbing - friendly, family-business vibe. 
          I'll be warm and helpful, maybe a bit folksy.
          
          One more thing - what are your service hours, and how should 
          I handle after-hours emergencies?"
          
[Continues until configuration is complete]
```

#### 6.2.2 Configuration Categories

| Category | What's Captured | How It's Asked |
|----------|-----------------|----------------|
| **Identity** | Business name, industry, location | Direct questions |
| **Personality** | Tone, formality, quirks | Descriptive question + examples |
| **Goals** | What success looks like | "What do you want to happen when..." |
| **Knowledge** | FAQs, services, policies | Document upload + Q&A |
| **Rules** | Guardrails, requirements | "What should I never do?" |
| **Handoffs** | When to escalate | Scenario-based questions |
| **Scheduling** | Hours, booking rules | Practical questions |

### 6.3 Behavior Preview & Testing

#### 6.3.1 Live Preview Mode

```
ConvoBot: "Want to test how I'll respond? Send me a message like 
          a lead would, and I'll show you what I'd say back."

User: "How much does it cost to fix a leaky faucet?"

ConvoBot: [Preview Response]
"Hey there! Leaky faucet - annoying, right? 😊 

The cost depends on what's causing it, but most faucet repairs 
run between $100-200 including parts. If it needs replacing, 
that's usually $150-300 depending on the fixture.

Want me to get one of our guys out to take a look? I can usually 
get same-day or next-day appointments!"

ConvoBot: [Back to Config Mode]
"That's how I'd respond. Too casual? Not enough detail? 
Let me know what to adjust."
```

#### 6.3.2 Scenario Testing

```
User: "What if someone is really angry?"

ConvoBot: "Good question! Let me show you. Pretend you're an angry customer:"

User: "This is ridiculous, your technician was 2 hours late and 
      now my basement is flooded!"

ConvoBot: [Preview Response]
"I'm so sorry - that's completely unacceptable and I can only imagine 
how frustrating that is. Let me get someone on this right away.

I'm pulling in our service manager to call you directly within 
the next 15 minutes. Can you confirm the best number to reach you?"

ConvoBot: [Back to Config Mode]
"For situations like this, I immediately show empathy, take responsibility, 
and escalate to a real person ASAP. I've flagged this for immediate 
human follow-up. Does that approach work for you?"
```

### 6.4 Knowledge Base Configuration

#### 6.4.1 Document Ingestion

```
ConvoBot: "If you have any documents - FAQ pages, service descriptions, 
          pricing sheets - I can learn from them. Just upload or paste!"

User: [Uploads PDF: "Smith Plumbing Service Guide"]

ConvoBot: "Got it! I learned about:
          • Your 15 service types (drain cleaning, water heaters, etc.)
          • Your service area (Austin metro, 30-mile radius)
          • Your pricing structure (service call fee + hourly)
          • Your guarantees (satisfaction guaranteed, licensed & insured)
          
          Anything I should NOT mention from this, or anything 
          that's out of date?"

User: "Don't mention the specific hourly rate, just say competitive pricing"

ConvoBot: "Smart - I'll keep pricing vague and focus on value. 
          If they push, I'll offer to have someone call with a quote."
```

#### 6.4.2 Q&A Training

```
ConvoBot: "What questions do you get asked most often that I should 
          be ready for?"

User: "People always ask if we work on tankless water heaters"

ConvoBot: "And what should I tell them?"

User: "Yes, we specialize in tankless! We're Rinnai certified."

ConvoBot: "Perfect! I'll mention the Rinnai certification - that's 
          a nice credibility boost. Any other common questions?"
```

### 6.5 Modification Interface

#### 6.5.1 Conversational Adjustments

```
User: "People are getting confused when you mention the service call fee"

ConvoBot: "Ah, I see - I've been bringing it up too early. 
          Want me to:
          A) Only mention it when they specifically ask about pricing
          B) Wait until we're about to book, then explain it
          C) Not mention it at all - let the office explain
          
          Or something else?"

User: "B sounds good"

ConvoBot: "Done! I'll only bring up the service call fee as part of 
          the booking confirmation. Let me know if that helps!"
```

#### 6.5.2 Learning from Corrections

```
[User reviews conversation log]

User: "This conversation here - you should have offered weekend 
      availability, we're open Saturdays"

ConvoBot: "Oops, you're right! I had you as M-F only. I've updated 
          to include Saturday availability. Is Sunday available too?"

User: "No, just Saturday 8-2"

ConvoBot: "Got it - Saturday 8am-2pm added. I'll offer those slots 
          going forward!"
```

### 6.6 Configuration Storage

All configuration is stored as structured data derived from conversation:

```json
{
  "business": {
    "name": "Smith Plumbing",
    "industry": "plumbing",
    "location": "Austin, TX",
    "serviceRadius": "30 miles"
  },
  "personality": {
    "tone": "friendly",
    "formality": "casual",
    "traits": ["warm", "folksy", "family-business-vibe"],
    "emojiUsage": "occasional"
  },
  "goals": [
    {
      "priority": 1,
      "type": "appointment_booking",
      "urgencyBoost": ["water heater", "emergency", "flooding"]
    },
    {
      "priority": 2,
      "type": "lead_qualification",
      "fields": ["service_needed", "timeline", "location"]
    }
  ],
  "knowledge": {
    "documents": ["service_guide_v2.pdf"],
    "faqs": [...],
    "restrictions": ["no_specific_hourly_rate"]
  },
  "hours": {
    "regular": { "mon-fri": "8:00-17:00", "sat": "8:00-14:00" },
    "emergency": { "enabled": true, "handler": "after_hours_service" }
  },
  "handoff": {
    "triggers": ["angry", "complex_complaint", "large_project"],
    "notification": ["sms", "email"],
    "response": "empathy_and_escalate"
  }
}
```

---

## 7. Multi-Channel Message Flow

### 7.1 Inbound Message Processing

```
┌────────────────────────────────────────────────────────────────┐
│                    Inbound Message Flow                         │
└────────────────────────────────────────────────────────────────┘

          ┌─────────────┐
          │ GHL Webhook │
          │  (Inbound)  │
          └──────┬──────┘
                 │
                 ▼
          ┌─────────────┐
          │  Validate   │──── Invalid ────> Log & Discard
          │  Webhook    │
          └──────┬──────┘
                 │ Valid
                 ▼
          ┌─────────────┐
          │   Dedupe    │──── Duplicate ──> Acknowledge & Skip
          │   Check     │
          └──────┬──────┘
                 │ New
                 ▼
          ┌─────────────┐
          │   Route     │
          │  by Type    │
          └──────┬──────┘
                 │
       ┌─────────┼─────────┐
       ▼         ▼         ▼
    ┌──────┐ ┌──────┐ ┌──────┐
    │ SMS  │ │Email │ │Social│
    │Handler│ │Handler│ │Handler│
    └──┬───┘ └──┬───┘ └──┬───┘
       │        │        │
       └────────┼────────┘
                │
                ▼
          ┌─────────────┐
          │   Load      │
          │  Context    │
          └──────┬──────┘
                 │
                 ▼
          ┌─────────────┐
          │   Check     │
          │  Filters    │──── Filtered ──> Skip (human only)
          └──────┬──────┘
                 │ Pass
                 ▼
          ┌─────────────┐
          │   Queue     │
          │ for LLM     │
          └─────────────┘
```

### 7.2 Response Generation

```
┌────────────────────────────────────────────────────────────────┐
│                   Response Generation Flow                      │
└────────────────────────────────────────────────────────────────┘

          ┌─────────────┐
          │  Message    │
          │   Queue     │
          └──────┬──────┘
                 │
                 ▼
          ┌─────────────┐
          │  Build      │
          │  Prompt     │
          └──────┬──────┘
                 │
    ┌────────────┼────────────┐
    │            │            │
    ▼            ▼            ▼
┌────────┐ ┌──────────┐ ┌──────────┐
│System  │ │Conversation│ │ Client  │
│Prompt  │ │ History   │ │Knowledge │
└────────┘ └──────────┘ └──────────┘
    │            │            │
    └────────────┼────────────┘
                 │
                 ▼
          ┌─────────────┐
          │    LLM      │
          │  Inference  │
          └──────┬──────┘
                 │
                 ▼
          ┌─────────────┐
          │   Parse     │
          │  Response   │
          └──────┬──────┘
                 │
       ┌─────────┼─────────┐
       │         │         │
       ▼         ▼         ▼
    ┌──────┐ ┌──────┐ ┌──────┐
    │Message│ │Action│ │Data  │
    │ Text │ │Intent│ │Extract│
    └──────┘ └──────┘ └──────┘
       │         │         │
       └─────────┼─────────┘
                 │
                 ▼
          ┌─────────────┐
          │   Channel   │
          │   Adapt     │
          └──────┬──────┘
                 │
                 ▼
          ┌─────────────┐
          │    Send     │
          │  via GHL    │
          └─────────────┘
```

### 7.3 Channel-Specific Handling

#### 7.3.1 SMS Processing

```yaml
SMS_Handler:
  max_length: 160 (or 1600 for concatenated)
  formatting:
    - No markdown
    - Minimal emoji (1-2 max)
    - Short sentences
    - Line breaks for readability
  special_handling:
    - MMS: Accept images, acknowledge receipt
    - Links: Shorten URLs
    - Phone numbers: Format for tap-to-call
  response_timing:
    - Target: < 30 seconds
    - Off-hours: Immediate with context-appropriate response
```

#### 7.3.2 Email Processing

```yaml
Email_Handler:
  formatting:
    - Proper subject line handling
    - Reply threading (In-Reply-To header)
    - Professional greeting/signature
    - HTML formatting when appropriate
  special_handling:
    - Attachments: Acknowledge, note for human review
    - Long threads: Summarize context
    - Auto-replies: Detect and handle appropriately
  response_timing:
    - Target: < 5 minutes
    - Batch processing: OK for non-urgent
```

#### 7.3.3 Social Media Processing

```yaml
Social_Handler:
  platform_adaptation:
    facebook:
      - Quick reply buttons when appropriate
      - Casual tone
      - Emoji-friendly
    instagram:
      - Very casual, on-trend
      - Story mentions: Reference appropriately
      - Visual-forward responses
  special_handling:
    - Media messages: Acknowledge the image/video
    - Reactions: Interpret as engagement signals
    - Public vs DM: Adjust formality
  response_timing:
    - Target: < 2 minutes
    - Active hours priority
```

### 7.4 Action Execution

When responses require actions beyond messaging:

```
┌────────────────────────────────────────────────────────────────┐
│                    Action Execution Flow                        │
└────────────────────────────────────────────────────────────────┘

          ┌─────────────┐
          │  Action     │
          │  Intent     │
          └──────┬──────┘
                 │
                 ▼
          ┌─────────────┐
          │   Action    │
          │   Router    │
          └──────┬──────┘
                 │
    ┌────────────┼────────────┬────────────┐
    │            │            │            │
    ▼            ▼            ▼            ▼
┌────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐
│ Book   │ │  Update  │ │  Create  │ │  Human   │
│Calendar│ │ Contact  │ │Opportunity│ │ Handoff  │
└────────┘ └──────────┘ └──────────┘ └──────────┘
    │            │            │            │
    └────────────┼────────────┴────────────┘
                 │
                 ▼
          ┌─────────────┐
          │  Execute    │
          │  via GHL    │
          └──────┬──────┘
                 │
                 ▼
          ┌─────────────┐
          │  Confirm &  │
          │   Notify    │
          └─────────────┘
```

### 7.5 Message Queue Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     Message Queue System                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────┐    ┌─────────────────┐                │
│  │  High Priority  │    │     Normal      │                │
│  │     Queue       │    │     Queue       │                │
│  │                 │    │                 │                │
│  │ • Emergencies   │    │ • Standard msgs │                │
│  │ • VIP contacts  │    │ • Follow-ups    │                │
│  │ • Angry/urgent  │    │ • Bulk          │                │
│  └────────┬────────┘    └────────┬────────┘                │
│           │                      │                          │
│           └──────────┬───────────┘                          │
│                      │                                      │
│                      ▼                                      │
│           ┌─────────────────────┐                           │
│           │   Worker Pool       │                           │
│           │   (Auto-scaling)    │                           │
│           └─────────────────────┘                           │
│                                                             │
│  Rate Limits:                                               │
│  • GHL API: 100 requests/min per location                  │
│  • LLM API: Per-model limits                               │
│  • Outbound SMS: Carrier-dependent                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 8. User Stories

### 8.1 Agency Setup Stories

#### US-001: Initial Platform Connection
**As an** agency admin  
**I want to** connect my client's GHL account to ConvoBot  
**So that** I can start automating their conversations

**Acceptance Criteria:**
- [ ] OAuth flow completes successfully
- [ ] All required GHL permissions are granted
- [ ] Location-specific access is established
- [ ] Webhooks are automatically configured
- [ ] Connection status is visible in dashboard

#### US-002: Bot Personality Configuration
**As an** agency admin  
**I want to** configure a bot's personality through conversation  
**So that** it matches the client's brand voice

**Acceptance Criteria:**
- [ ] Can describe personality in natural language
- [ ] System asks clarifying questions
- [ ] Can preview personality in test messages
- [ ] Can adjust personality through continued conversation
- [ ] Configuration is saved and applied to all channels

#### US-003: Knowledge Base Setup
**As an** agency admin  
**I want to** upload documents and answer questions to build knowledge  
**So that** the bot can answer client-specific questions

**Acceptance Criteria:**
- [ ] Can upload PDF, DOC, TXT files
- [ ] System extracts and summarizes uploaded content
- [ ] Can add Q&A pairs through conversation
- [ ] Can specify what information to NOT share
- [ ] Knowledge is searchable and editable

### 8.2 Business Owner Stories

#### US-004: Self-Service Behavior Adjustment
**As a** business owner  
**I want to** tell my bot to change how it handles certain situations  
**So that** I can improve responses without calling support

**Acceptance Criteria:**
- [ ] Can message the bot to make changes
- [ ] Bot confirms understanding of requested changes
- [ ] Changes take effect immediately
- [ ] Can preview changes before confirming
- [ ] Change history is logged

#### US-005: View Conversation Performance
**As a** business owner  
**I want to** see how many appointments my bot has booked  
**So that** I can understand the ROI

**Acceptance Criteria:**
- [ ] Dashboard shows appointment count
- [ ] Can filter by date range
- [ ] Can see conversion funnel (messages → qualified → booked)
- [ ] Can compare to previous periods
- [ ] Can export data

#### US-006: Review Conversation Quality
**As a** business owner  
**I want to** read actual bot conversations  
**So that** I can ensure quality and identify improvements

**Acceptance Criteria:**
- [ ] Can browse all conversations
- [ ] Can search by keyword or contact
- [ ] Can filter by outcome (booked, lost, pending)
- [ ] Can flag conversations for review
- [ ] Can provide feedback that improves the bot

### 8.3 Conversation Flow Stories

#### US-007: Lead Qualification
**As a** bot  
**I want to** naturally gather qualification information  
**So that** I can route leads appropriately

**Acceptance Criteria:**
- [ ] Collects configured qualification fields
- [ ] Asks questions conversationally, not as a form
- [ ] Adapts question order based on conversation flow
- [ ] Stores qualification data in GHL contact
- [ ] Updates opportunity stage based on qualification

#### US-008: Appointment Booking
**As a** bot  
**I want to** book appointments using available calendar slots  
**So that** leads can schedule without human intervention

**Acceptance Criteria:**
- [ ] Checks real-time availability
- [ ] Offers multiple time options
- [ ] Handles rescheduling requests
- [ ] Confirms booking details before finalizing
- [ ] Sends confirmation via appropriate channel
- [ ] Creates appointment in GHL calendar

#### US-009: Objection Handling
**As a** bot  
**I want to** respond effectively to common objections  
**So that** I can keep conversations moving toward goals

**Acceptance Criteria:**
- [ ] Recognizes common objection patterns
- [ ] Responds with configured objection handlers
- [ ] Adapts based on objection severity
- [ ] Knows when to escalate vs. handle
- [ ] Logs objections for analysis

#### US-010: Human Handoff
**As a** bot  
**I want to** seamlessly transfer to a human when needed  
**So that** complex situations get appropriate handling

**Acceptance Criteria:**
- [ ] Recognizes handoff trigger conditions
- [ ] Notifies appropriate human(s)
- [ ] Provides conversation context summary
- [ ] Sends appropriate "transferring you" message
- [ ] Tracks handoff outcomes

### 8.4 Multi-Channel Stories

#### US-011: Cross-Channel Context
**As a** bot  
**I want to** remember conversations across channels  
**So that** leads don't have to repeat themselves

**Acceptance Criteria:**
- [ ] Recognizes same contact across channels
- [ ] References previous conversation naturally
- [ ] Doesn't ask questions already answered
- [ ] Picks up where previous conversation left off
- [ ] Conversation history shows all channels

#### US-012: Channel-Appropriate Responses
**As a** bot  
**I want to** adapt my responses to each channel  
**So that** messages feel natural for the platform

**Acceptance Criteria:**
- [ ] SMS responses are concise
- [ ] Email responses are properly formatted
- [ ] Social responses match platform norms
- [ ] Same information conveyed appropriately per channel
- [ ] Channel preferences are respected

### 8.5 Operations Stories

#### US-013: After-Hours Handling
**As a** bot  
**I want to** handle after-hours inquiries appropriately  
**So that** leads feel acknowledged and emergencies are handled

**Acceptance Criteria:**
- [ ] Responds even outside business hours
- [ ] Acknowledges timing context ("I know it's late...")
- [ ] Identifies true emergencies for immediate escalation
- [ ] Offers next-day follow-up for non-urgent
- [ ] Queues for morning human review when appropriate

#### US-014: Error Recovery
**As a** bot  
**I want to** handle errors gracefully  
**So that** conversations aren't abandoned

**Acceptance Criteria:**
- [ ] Detects when conversation is going poorly
- [ ] Attempts recovery with clarification
- [ ] Escalates after repeated failures
- [ ] Never leaves message unanswered
- [ ] Logs errors for debugging

---

## 9. Technical Requirements

### 9.1 System Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                        ConvoBot Architecture                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                      Load Balancer                           │   │
│  │                    (Cloudflare/AWS ALB)                      │   │
│  └──────────────────────────┬──────────────────────────────────┘   │
│                             │                                       │
│  ┌──────────────────────────┴──────────────────────────────────┐   │
│  │                       API Gateway                            │   │
│  │                  (Rate limiting, auth)                       │   │
│  └──────────────────────────┬──────────────────────────────────┘   │
│                             │                                       │
│  ┌──────────────────────────┴──────────────────────────────────┐   │
│  │                    Application Tier                          │   │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐          │   │
│  │  │   Webhook   │  │   Config    │  │  Dashboard  │          │   │
│  │  │   Handler   │  │    API      │  │    API      │          │   │
│  │  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘          │   │
│  │         │                │                │                  │   │
│  │         └────────────────┼────────────────┘                  │   │
│  │                          │                                   │   │
│  │                          ▼                                   │   │
│  │  ┌─────────────────────────────────────────────────────┐    │   │
│  │  │              Core Processing Engine                  │    │   │
│  │  │                                                      │    │   │
│  │  │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌────────┐  │    │   │
│  │  │  │ Context  │ │  Prompt  │ │   LLM    │ │ Action │  │    │   │
│  │  │  │ Manager  │ │ Builder  │ │ Gateway  │ │Executor│  │    │   │
│  │  │  └──────────┘ └──────────┘ └──────────┘ └────────┘  │    │   │
│  │  │                                                      │    │   │
│  │  └─────────────────────────────────────────────────────┘    │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                       Data Tier                              │   │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐    │   │
│  │  │PostgreSQL│  │  Redis   │  │ Pinecone │  │   S3     │    │   │
│  │  │ (Primary)│  │ (Cache)  │  │ (Vector) │  │ (Files)  │    │   │
│  │  └──────────┘  └──────────┘  └──────────┘  └──────────┘    │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                    Message Queue                             │   │
│  │                  (Redis/BullMQ or SQS)                       │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 9.2 Technology Stack

| Layer | Technology | Rationale |
|-------|-----------|-----------|
| **Runtime** | Node.js 22+ | Async-native, TypeScript support, ecosystem |
| **Framework** | Hono or Express | Lightweight, fast, well-documented |
| **Database** | PostgreSQL 16 | Reliability, JSON support, full-text search |
| **Cache** | Redis 7 | Speed, pub/sub, queue backend |
| **Vector DB** | Pinecone or pgvector | Knowledge base semantic search |
| **Queue** | BullMQ (Redis) | Reliability, priority queues, rate limiting |
| **LLM** | Claude 3.5 Sonnet (primary) | Quality, speed, cost balance |
| **File Storage** | S3-compatible | Documents, logs, exports |
| **Hosting** | AWS/Fly.io/Railway | Auto-scaling, reliability |

### 9.3 Data Models

#### 9.3.1 Core Entities

```typescript
// Organization (Agency)
interface Organization {
  id: string;
  name: string;
  plan: 'starter' | 'professional' | 'agency';
  settings: OrganizationSettings;
  createdAt: Date;
  updatedAt: Date;
}

// Location (Client Business - maps to GHL Location)
interface Location {
  id: string;
  organizationId: string;
  ghlLocationId: string;
  name: string;
  industry: string;
  timezone: string;
  config: BotConfig;
  status: 'active' | 'paused' | 'disconnected';
  createdAt: Date;
  updatedAt: Date;
}

// Bot Configuration
interface BotConfig {
  personality: {
    tone: string;
    formality: 'formal' | 'neutral' | 'casual';
    traits: string[];
    emojiUsage: 'none' | 'minimal' | 'moderate' | 'frequent';
    samplePhrases: string[];
  };
  goals: {
    priority: number;
    type: 'appointment_booking' | 'lead_qualification' | 'information' | 'support';
    settings: Record<string, any>;
  }[];
  knowledge: {
    documents: string[]; // S3 keys
    faqs: { question: string; answer: string; }[];
    restrictions: string[];
  };
  scheduling: {
    businessHours: Record<string, { start: string; end: string; }>;
    afterHoursMode: 'respond' | 'acknowledge' | 'emergency_only';
    emergencyKeywords: string[];
  };
  handoff: {
    triggers: string[];
    notificationChannels: ('sms' | 'email' | 'push')[];
    notificationRecipients: string[];
  };
  channelSettings: Record<string, ChannelConfig>;
}

// Conversation
interface Conversation {
  id: string;
  locationId: string;
  ghlConversationId: string;
  contactId: string;
  channel: 'sms' | 'email' | 'facebook' | 'instagram' | 'webchat';
  status: 'active' | 'handed_off' | 'completed' | 'stale';
  outcome: 'booked' | 'qualified' | 'disqualified' | 'lost' | 'pending' | null;
  metadata: {
    qualification: Record<string, any>;
    sentiment: number;
    handoffReason: string | null;
  };
  lastMessageAt: Date;
  createdAt: Date;
  updatedAt: Date;
}

// Message
interface Message {
  id: string;
  conversationId: string;
  ghlMessageId: string;
  direction: 'inbound' | 'outbound';
  channel: string;
  content: string;
  contentType: 'text' | 'image' | 'document' | 'audio';
  author: 'contact' | 'bot' | 'human';
  metadata: {
    processingTimeMs: number;
    model: string | null;
    tokensUsed: number | null;
    actions: string[];
  };
  createdAt: Date;
}
```

### 9.4 API Specifications

#### 9.4.1 Webhook Endpoints

```yaml
POST /webhooks/ghl
  description: Receive GoHighLevel webhook events
  security: HMAC signature verification
  events:
    - InboundMessage
    - ContactCreate
    - ContactUpdate
    - AppointmentCreate
    - AppointmentUpdate
  response: 200 OK (async processing)

POST /webhooks/ghl/oauth
  description: OAuth callback for GHL connection
  params:
    - code: Authorization code
    - state: CSRF token
  response: Redirect to dashboard
```

#### 9.4.2 Configuration API

```yaml
POST /api/locations/{id}/config/chat
  description: Conversational configuration endpoint
  body:
    message: string
    preview: boolean (optional)
  response:
    reply: string
    configChanges: object | null
    previewResponse: string | null

GET /api/locations/{id}/config
  description: Get current configuration
  response: BotConfig

POST /api/locations/{id}/knowledge
  description: Upload knowledge document
  body: multipart/form-data (file)
  response:
    documentId: string
    extractedContent: string
    suggestedFaqs: array
```

#### 9.4.3 Dashboard API

```yaml
GET /api/locations/{id}/analytics
  params:
    startDate: ISO date
    endDate: ISO date
    metrics: array
  response:
    conversations: number
    messages: number
    bookings: number
    qualificationRate: number
    bookingRate: number
    avgResponseTime: number
    sentimentAvg: number

GET /api/locations/{id}/conversations
  params:
    page: number
    limit: number
    status: filter
    outcome: filter
    search: string
  response:
    conversations: Conversation[]
    total: number
    page: number

GET /api/conversations/{id}/messages
  response:
    messages: Message[]
```

### 9.5 Security Requirements

#### 9.5.1 Authentication & Authorization

| Requirement | Implementation |
|-------------|---------------|
| API Authentication | JWT tokens with refresh |
| OAuth Tokens | Encrypted storage, auto-refresh |
| Webhook Verification | HMAC-SHA256 signatures |
| Role-Based Access | Organization → Location → User hierarchy |
| Session Management | Secure, httpOnly cookies |

#### 9.5.2 Data Security

| Requirement | Implementation |
|-------------|---------------|
| Encryption at Rest | AES-256 for sensitive fields |
| Encryption in Transit | TLS 1.3 minimum |
| PII Handling | Minimal retention, scrubbing options |
| Audit Logging | All config changes, access events |
| Backup | Daily automated, 30-day retention |

#### 9.5.3 Compliance

| Standard | Approach |
|----------|----------|
| SOC 2 Type II | Process controls, annual audit (future) |
| GDPR | Data deletion, export, consent tracking |
| CCPA | California privacy rights support |
| TCPA | Consent verification before messaging |

### 9.6 Performance Requirements

| Metric | Target | Critical Threshold |
|--------|--------|-------------------|
| Webhook Response | < 200ms | < 500ms |
| Message Processing | < 5s (end-to-end) | < 10s |
| API Response | < 100ms (p95) | < 500ms |
| Dashboard Load | < 2s | < 5s |
| Uptime | 99.9% | 99.5% |

### 9.7 Scalability Requirements

| Dimension | Initial Capacity | Target (12 months) |
|-----------|-----------------|-------------------|
| Locations | 50 | 500 |
| Messages/day | 10,000 | 500,000 |
| Concurrent conversations | 100 | 5,000 |
| Knowledge base per location | 100MB | 100MB |

---

## 10. MVP Scope vs Future Features

### 10.1 MVP (Phase 1) - 8 weeks

**Goal:** Replace CloseBot for existing clients with core functionality

#### Included Features

| Category | Feature | Priority |
|----------|---------|----------|
| **Integration** | GHL OAuth connection | P0 |
| **Integration** | Webhook processing (SMS, Email) | P0 |
| **Integration** | Send messages via GHL | P0 |
| **Integration** | Calendar integration (read availability) | P0 |
| **Conversation** | LLM-powered response generation | P0 |
| **Conversation** | Context management (conversation history) | P0 |
| **Conversation** | Basic qualification data collection | P0 |
| **Config** | Conversational setup (basic) | P0 |
| **Config** | Personality configuration | P0 |
| **Config** | Goal setting | P1 |
| **Booking** | Appointment booking | P0 |
| **Booking** | Confirmation messages | P0 |
| **Handoff** | Basic human handoff | P1 |
| **Dashboard** | Conversation list view | P1 |
| **Dashboard** | Basic analytics (volume, bookings) | P1 |

#### Excluded from MVP

- Social media channels (Facebook, Instagram)
- Document upload for knowledge base
- Advanced objection handling configuration
- White-label options
- Multi-language support
- Advanced analytics

### 10.2 Phase 2 - 6 weeks

**Goal:** Feature parity with CloseBot plus differentiation

| Category | Feature |
|----------|---------|
| **Channels** | Facebook Messenger integration |
| **Channels** | Instagram DM integration |
| **Knowledge** | Document upload and processing |
| **Knowledge** | FAQ management interface |
| **Config** | Objection handling configuration |
| **Config** | Advanced handoff rules |
| **Analytics** | Conversation quality scoring |
| **Analytics** | Conversion funnel visualization |
| **Dashboard** | Conversation search and filtering |
| **Dashboard** | Export functionality |

### 10.3 Phase 3 - 8 weeks

**Goal:** Agency-scale features and optimization

| Category | Feature |
|----------|---------|
| **Multi-tenant** | Agency dashboard (all clients) |
| **Multi-tenant** | Bulk configuration tools |
| **Multi-tenant** | Template library |
| **White-label** | Custom branding |
| **White-label** | Custom domains |
| **Advanced AI** | A/B testing for responses |
| **Advanced AI** | Automatic optimization |
| **Advanced AI** | Sentiment trend analysis |
| **Integration** | CRM field mapping customization |
| **Integration** | Custom webhook actions |

### 10.4 Future Considerations (Phase 4+)

| Feature | Value | Complexity |
|---------|-------|-----------|
| Voice AI (phone calls) | High | Very High |
| Multi-language | High | Medium |
| Custom LLM fine-tuning | Medium | High |
| Workflow builder (visual) | Medium | High |
| Mobile app | Medium | Medium |
| Public API for developers | Medium | Medium |
| Marketplace (templates) | Low | Medium |

### 10.5 Technical Debt & Infrastructure

| Item | Phase |
|------|-------|
| Comprehensive test coverage | Ongoing |
| Performance optimization | Phase 2 |
| Advanced monitoring/alerting | Phase 2 |
| Disaster recovery testing | Phase 2 |
| Security audit | Phase 3 |
| SOC 2 preparation | Phase 4 |

---

## 11. Competitive Analysis

### 11.1 Direct Competitors

#### CloseBot

| Aspect | Analysis |
|--------|----------|
| **Overview** | #1 rated AI appointment setter for agencies, 700K+ appointments booked |
| **Strengths** | Established market presence, GHL native integration, proven results |
| **Weaknesses** | Flow-based configuration requires technical skill, rigid conversation handling |
| **Pricing** | Per-message/per-appointment model, adds up for high volume |
| **Key Features** | Personas, Job Flows, multi-channel, dashboard, whitelabel |
| **Our Advantage** | Conversational configuration, more natural AI responses, ownership/control |

#### Synthflow AI

| Aspect | Analysis |
|--------|----------|
| **Overview** | Enterprise voice AI platform, focuses on phone calls |
| **Strengths** | In-house telephony, advanced voice capabilities, enterprise-ready |
| **Weaknesses** | Voice-first (text secondary), enterprise pricing, complex setup |
| **Pricing** | Enterprise custom pricing |
| **Key Features** | Voice agents, flow builder, real-time booking, prompt-based config |
| **Our Advantage** | Text-first, simpler setup, SMB-friendly pricing, conversational config |

#### Bland AI

| Aspect | Analysis |
|--------|----------|
| **Overview** | Fastest conversational AI, enterprise-focused, omni-channel |
| **Strengths** | Speed, custom models, enterprise scale, no external LLM dependency |
| **Weaknesses** | Enterprise-only, requires forward-deployed engineers, overkill for SMB |
| **Pricing** | Enterprise custom (high) |
| **Key Features** | Calls/SMS/Chat, custom models, strict guardrails, dedicated infrastructure |
| **Our Advantage** | Accessible to SMB/agencies, self-service setup, GHL-native |

#### Voiceflow

| Aspect | Analysis |
|--------|----------|
| **Overview** | Platform for building AI agents, broad applicability |
| **Strengths** | Flexible, developer-friendly, good integrations, observability |
| **Weaknesses** | General-purpose (not appointment-focused), learning curve |
| **Pricing** | Free tier, then usage-based |
| **Key Features** | Visual builder, API integrations, analytics, team collaboration |
| **Our Advantage** | Purpose-built for lead follow-up, GHL-native, no-code natural language setup |

### 11.2 Competitive Positioning Matrix

```
                    Simple Setup
                         │
                         │
        ConvoBot ←───────┼───────→ CloseBot
    (Conversational)     │      (Flow Builder)
                         │
        ─────────────────┼─────────────────────
                         │
                         │
                         │
     Voiceflow ←─────────┼───────→ Bland/Synthflow
  (General Purpose)      │        (Enterprise Voice)
                         │
                    Complex Setup
```

### 11.3 Competitive Advantages

| Advantage | Description | Defensibility |
|-----------|-------------|---------------|
| **Conversational Config** | Configure through chat, not forms/flows | High - requires significant AI work |
| **GHL-Native** | Deep integration, not just API connection | Medium - others can replicate |
| **Agency-Owned** | No third-party dependency for F&C clients | High - operational advantage |
| **Modern AI** | Latest LLM capabilities, not rule-based | Medium - commoditizing |
| **Price Control** | Can price competitively without third-party margin | High - structural advantage |

### 11.4 Competitive Risks

| Risk | Mitigation |
|------|-----------|
| CloseBot adds conversational config | Move fast, build switching costs with quality |
| GHL builds native AI | Deep integration, value-add features they won't build |
| Price war | Differentiate on quality, not price |
| LLM cost increases | Model flexibility, efficiency optimizations |

---

## 12. Success Metrics

### 12.1 Product Metrics

#### Adoption Metrics

| Metric | MVP Target | Phase 2 Target | Measurement |
|--------|------------|----------------|-------------|
| Locations Connected | 20 | 100 | Count of active GHL locations |
| Daily Active Conversations | 500 | 5,000 | Unique conversations/day |
| Configuration Completion Rate | 80% | 90% | % of setups completed within 24h |
| Time to First Response | < 2 hours | < 1 hour | Median time from connect to live |

#### Quality Metrics

| Metric | MVP Target | Phase 2 Target | Measurement |
|--------|------------|----------------|-------------|
| Response Accuracy | 85% | 92% | % of responses rated acceptable |
| Booking Success Rate | 25% | 35% | Bookings / qualified leads |
| Handoff Rate | < 20% | < 12% | % requiring human intervention |
| Customer Satisfaction | 4.0/5 | 4.5/5 | Post-conversation surveys |

#### Engagement Metrics

| Metric | MVP Target | Phase 2 Target | Measurement |
|--------|------------|----------------|-------------|
| Conversation Depth | 4+ messages | 5+ messages | Avg messages per conversation |
| Response Rate | 70% | 80% | % of leads who respond |
| Return Conversation Rate | 15% | 25% | % who start new conversation |
| Config Modification Rate | 2x/month | 3x/month | Config changes per location |

### 12.2 Business Metrics

#### Revenue Metrics

| Metric | MVP Target | 6-Month Target | 12-Month Target |
|--------|------------|----------------|-----------------|
| MRR | $5,000 | $15,000 | $35,000 |
| Clients | 15 | 50 | 120 |
| ARPU | $333 | $300 | $292 |
| Gross Margin | 60% | 70% | 75% |

#### Efficiency Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Cost per Conversation | < $0.15 | LLM + infrastructure / conversations |
| Support Tickets per Client | < 2/month | Zendesk/intercom tracking |
| Churn Rate | < 5%/month | Lost clients / total clients |
| NPS | > 40 | Quarterly survey |

### 12.3 Operational Metrics

| Metric | Target | Alert Threshold |
|--------|--------|-----------------|
| System Uptime | 99.9% | < 99.5% |
| Average Response Time | < 3s | > 8s |
| Error Rate | < 0.1% | > 1% |
| Queue Depth | < 100 | > 500 |
| Webhook Success Rate | > 99.9% | < 99% |

### 12.4 Comparison Metrics (vs CloseBot)

| Metric | CloseBot Baseline | ConvoBot Target | How We'll Measure |
|--------|-------------------|-----------------|-------------------|
| Setup Time | 2-4 hours | < 30 minutes | Time tracking |
| Booking Rate | ~20% | 25%+ | A/B testing same leads |
| Response Naturalness | 3.5/5 | 4.5/5 | Blind evaluation |
| Cost per Booking | $X | 30% less | Financial tracking |
| Client Satisfaction | 4.0/5 | 4.5/5 | Survey comparison |

### 12.5 Success Criteria by Phase

#### MVP Success (8 weeks)

- [ ] 10+ locations live and processing messages
- [ ] 500+ bookings made through ConvoBot
- [ ] < 20% of conversations require human intervention
- [ ] Positive feedback from 80%+ of pilot clients
- [ ] System stability > 99% uptime

#### Phase 2 Success (14 weeks)

- [ ] 50+ locations live
- [ ] Social channels active and performing
- [ ] Document-based knowledge working effectively
- [ ] Advanced analytics driving client decisions
- [ ] MRR > $10,000

#### Phase 3 Success (22 weeks)

- [ ] 100+ locations across multiple agencies
- [ ] White-label deployments live
- [ ] Demonstrated improvement over CloseBot metrics
- [ ] Path to profitability clear
- [ ] External interest in platform

---

## Appendix A: Glossary

| Term | Definition |
|------|------------|
| **GHL** | GoHighLevel - CRM and marketing automation platform |
| **Location** | A GHL sub-account representing one business |
| **Conversation** | A thread of messages with a single contact |
| **Handoff** | Transfer of conversation from bot to human |
| **Qualification** | Process of determining lead readiness/fit |
| **Knowledge Base** | Information the bot uses to answer questions |
| **Persona** | The personality and style of the bot |

## Appendix B: Open Questions

1. **Pricing Model:** Per-seat, per-message, per-booking, or flat rate?
2. **LLM Selection:** Claude vs GPT-4 vs mixture for different tasks?
3. **White-label Priority:** How soon do we need full white-label?
4. **Voice Integration:** Is Synthflow-style voice calling in scope?
5. **Compliance:** HIPAA compliance for healthcare clients?

## Appendix C: References

- [GoHighLevel Developer Documentation](https://highlevel.stoplight.io/docs/integrations/)
- [CloseBot Product Overview](https://closebot.com)
- [Anthropic Claude Documentation](https://docs.anthropic.com)
- [GHL Marketplace Requirements](https://marketplace.gohighlevel.com)

---

**Document History:**

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-26 | Freedom & Coffee Engineering | Initial draft |

---

*This document is a living artifact and will be updated as requirements evolve and learnings emerge from development and user feedback.*
