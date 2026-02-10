# Mantis Product Spec
## "OpenClaw for Everyone"

**Version:** 0.1 (Draft)  
**Date:** 2026-02-05  
**Author:** MantisClaw + Jordan

---

## 1. Vision

**Mantis** is a hosted, consumer-friendly AI assistant platform that brings OpenClaw's agentic capabilities to mainstream users. It looks and feels like ChatGPT, but can actually *do things* on behalf of users — not just chat.

**Tagline ideas:**
- "The AI that actually does stuff"
- "Your AI, your actions"
- "Chat is just the beginning"

---

## 2. Target Users

### Primary
- **Power users** who want AI automation but can't/won't self-host
- **Small business owners** who need an AI assistant that can take actions
- **Professionals** (lawyers, doctors, consultants) who need secure, capable AI

### Secondary
- **Teams** who want shared AI capabilities with audit trails
- **Developers** who want to prototype AI-powered workflows without infrastructure

### Anti-personas (not for)
- Users who just want basic chat (use ChatGPT)
- Enterprise with strict on-prem requirements (use self-hosted OpenClaw)

---

## 3. Core Capabilities

### 3.1 Communication & Messaging

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **Email (Read)** | Read and summarize inbox, search emails | 🟢 Low risk |
| **Email (Send)** | Draft and send emails on user's behalf | 🟡 Medium - requires confirmation |
| **Calendar (Read)** | View upcoming events, check availability | 🟢 Low risk |
| **Calendar (Write)** | Create/modify/delete events | 🟡 Medium - requires confirmation |
| **SMS/iMessage** | Send texts via Twilio or native integrations | 🟡 Medium - requires confirmation |
| **Slack/Discord/Teams** | Post messages, react, manage channels | 🟡 Medium - requires confirmation |
| **WhatsApp/Telegram** | Send messages via connected accounts | 🟡 Medium - requires confirmation |

### 3.2 Productivity & Tasks

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **Reminders** | Set time-based reminders, recurring tasks | 🟢 Low risk |
| **To-Do Lists** | Create/manage tasks (Apple Reminders, Todoist, Things, etc.) | 🟢 Low risk |
| **Notes** | Create/search notes (Notion, Obsidian, Apple Notes, Bear) | 🟢 Low risk |
| **Project Management** | Trello, Asana, Linear card/task management | 🟡 Medium |
| **Document Creation** | Generate docs, spreadsheets, presentations | 🟢 Low risk |

### 3.3 Web & Research

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **Web Search** | Search the web (Brave, Perplexity) | 🟢 Low risk |
| **Web Fetch** | Extract content from URLs | 🟢 Low risk |
| **Browser Automation** | Navigate sites, fill forms, extract data | 🟡 Medium |
| **Browser (Authenticated)** | Use logged-in sessions for actions | 🔴 High - strict controls |

### 3.4 Developer & Code

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **GitHub** | Issues, PRs, code review, CI status | 🟡 Medium |
| **Code Generation** | Write, edit, refactor code | 🟢 Low risk (sandbox) |
| **Code Execution** | Run code in sandboxed environment | 🟡 Medium (sandboxed) |
| **API Calls** | Make HTTP requests to user-authorized APIs | 🟡 Medium |

### 3.5 Smart Home & IoT

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **Lights** | Control Philips Hue, HomeKit, etc. | 🟢 Low risk |
| **Thermostat** | Adjust temperature | 🟢 Low risk |
| **Media** | Sonos, Spotify, Apple Music control | 🟢 Low risk |
| **Security** | Locks, cameras (view only) | 🟡 Medium |

### 3.6 Finance & Commerce

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **Bank (Read-only)** | View balances, transactions (via Plaid) | 🟡 Medium |
| **Expense Tracking** | Log and categorize expenses | 🟢 Low risk |
| **Shopping Lists** | Maintain and share shopping lists | 🟢 Low risk |
| **Order Food** | Reorder from saved favorites | 🔴 High - explicit confirmation |
| **Purchases** | Buy items online | 🔴 High - explicit confirmation + limits |

### 3.7 Voice & Phone

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **Voice Chat** | Speak to Mantis via browser/app | 🟢 Low risk |
| **Phone Calls (Receive)** | Answer calls as AI assistant | 🟡 Medium |
| **Phone Calls (Make)** | Place calls on user's behalf | 🔴 High - explicit confirmation |
| **Voicemail** | Transcribe and summarize voicemails | 🟢 Low risk |

### 3.8 Automation & Scheduling

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **Cron Jobs** | Scheduled recurring tasks | 🟡 Medium |
| **Webhooks** | React to external events | 🟡 Medium |
| **Workflows** | Multi-step automated processes | 🟡 Medium |
| **Heartbeats** | Proactive check-ins and monitoring | 🟢 Low risk |

### 3.9 Memory & Context

| Feature | Description | Safety Level |
|---------|-------------|--------------|
| **Long-term Memory** | Remember preferences, past conversations | 🟢 Low risk |
| **File Storage** | Store and retrieve user documents | 🟢 Low risk |
| **Knowledge Base** | Personal wiki/notes the AI can reference | 🟢 Low risk |

---

## 4. Safety Rails & Trust Levels

### 4.1 Action Classification

**🟢 Green (Auto-execute):**
- Read-only operations
- Creating drafts (not sending)
- Internal notes/reminders
- Queries and searches

**🟡 Yellow (Confirm):**
- Sending messages to others
- Creating/modifying external records
- Posting to social media
- Modifying calendar events

**🔴 Red (Explicit Approval + Limits):**
- Financial transactions
- Deleting data
- Account modifications
- Phone calls on user's behalf
- Anything involving money

### 4.2 Trust Levels (User-Configurable)

| Level | Description | Example |
|-------|-------------|---------|
| **Paranoid** | Confirm everything, even reads | New users, sensitive accounts |
| **Cautious** | Confirm all writes, auto-approve reads | Default for most users |
| **Balanced** | Auto-approve low-risk writes, confirm medium+ | Power users |
| **Trusted** | Auto-approve most, confirm only red actions | Long-term users with established patterns |

### 4.3 Safety Mechanisms

1. **Undo Windows**
   - 30-second undo for sent messages
   - 5-minute undo for calendar changes
   - Reversible actions marked clearly

2. **Spending Limits**
   - Daily/weekly/monthly caps on purchases
   - Per-transaction limits
   - Require re-auth above thresholds

3. **Recipient Allowlists**
   - Pre-approved contacts for auto-send
   - Unknown recipients require confirmation
   - Block list for never-contact

4. **Audit Trail**
   - Complete log of all actions taken
   - Exportable history
   - "Why did you do this?" explanations

5. **Impersonation Protection**
   - Clear disclosure in automated messages
   - "Sent by Mantis on behalf of [User]" footer option
   - No deceptive identity claims

6. **Rate Limits**
   - Max actions per hour/day
   - Burst protection
   - Anomaly detection

7. **Dry Run Mode**
   - Preview what would happen without executing
   - Useful for complex workflows
   - Required for red actions before first execution

---

## 5. User Experience

### 5.1 Chat Interface

```
┌─────────────────────────────────────────────────────────────┐
│  Mantis                                          [Settings] │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  You: Can you schedule a meeting with Sarah for next week?  │
│                                                             │
│  Mantis: I found Sarah Chen in your contacts. I can see     │
│  you're both free on:                                       │
│  • Tuesday 2pm-3pm                                          │
│  • Thursday 10am-11am                                       │
│                                                             │
│  Want me to send her a calendar invite? What topic?         │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ [Draft Email] [Send Invite] [Check More Times]      │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  [Voice] Type a message...                          [Send]  │
└─────────────────────────────────────────────────────────────┘
```

### 5.2 Action Cards

When Mantis wants to take an action, it presents a clear card:

```
┌─────────────────────────────────────────────────────────────┐
│ 📧 SEND EMAIL                                    [Pending]  │
├─────────────────────────────────────────────────────────────┤
│ To: sarah.chen@company.com                                  │
│ Subject: Meeting Request - Q1 Planning                      │
│ Body: Hi Sarah, [preview]...                               │
│                                                             │
│ [✓ Approve]  [✎ Edit]  [✗ Cancel]                          │
└─────────────────────────────────────────────────────────────┘
```

### 5.3 Activity Feed

Sidebar showing recent actions:

```
┌──────────────────────────┐
│ Recent Activity          │
├──────────────────────────┤
│ ✓ Email sent to Sarah    │
│   2 min ago              │
│                          │
│ ✓ Reminder set: Call mom │
│   15 min ago             │
│                          │
│ ⏳ Waiting: Buy groceries │
│   (needs confirmation)    │
│                          │
│ ✗ Cancelled: Tweet draft │
│   1 hour ago             │
└──────────────────────────┘
```

---

## 6. Integrations

### 6.1 OAuth Connections

Users connect services via OAuth where available:

- Google (Gmail, Calendar, Drive, Docs)
- Microsoft (Outlook, Teams, OneDrive)
- Slack
- Discord
- GitHub
- Notion
- Trello/Asana/Linear
- Spotify
- Todoist
- And more...

### 6.2 API Key Integrations

For services without OAuth:

- Twilio (SMS/Voice)
- Brave Search
- OpenAI / Anthropic (user's own keys optional)
- Custom webhooks

### 6.3 Native Integrations (Mantis Desktop App)

Optional desktop app for deeper OS integration:

- Apple Reminders
- Apple Notes
- Apple Calendar
- iMessage
- Spotlight search
- File system access

---

## 7. Pricing Tiers

### Free Tier
- 50 actions/month
- Basic integrations (3 services)
- 7-day memory
- Community support

### Pro ($20/month)
- Unlimited actions
- All integrations
- Unlimited memory
- Priority support
- Custom workflows
- Voice calling (100 min)

### Team ($15/user/month, min 3)
- Everything in Pro
- Shared knowledge base
- Team audit logs
- Admin controls
- SSO

### Enterprise (Custom)
- Self-hosted option
- Custom integrations
- Dedicated support
- SLA guarantees
- Compliance features (SOC2, HIPAA)

---

## 8. Technical Architecture

### 8.1 High-Level

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Web UI    │────▶│   Gateway   │────▶│  Executor   │
│  (React)    │     │  (Node.js)  │     │ (Sandboxed) │
└─────────────┘     └─────────────┘     └─────────────┘
                           │
                    ┌──────┴──────┐
                    ▼             ▼
              ┌──────────┐  ┌──────────┐
              │ LLM APIs │  │ User     │
              │(Anthropic│  │Services  │
              │ OpenAI)  │  │(OAuth)   │
              └──────────┘  └──────────┘
```

### 8.2 Multi-Tenant Considerations

- **Isolation**: Each user gets isolated execution environment
- **Secrets**: Encrypted at rest, never logged
- **Rate limiting**: Per-user limits
- **Audit logs**: Immutable, user-accessible

### 8.3 Execution Environment

- Sandboxed containers for code execution
- Network egress controls
- Time limits on executions
- Resource quotas

---

## 9. Competitive Landscape

| Product | Actions | Memory | Voice | Price |
|---------|---------|--------|-------|-------|
| ChatGPT | Limited | ✓ | ✓ | $20/mo |
| Claude | None | ✓ | ✗ | $20/mo |
| Operator | Browser only | ✓ | ✗ | ?? |
| **Mantis** | Full suite | ✓ | ✓ | $20/mo |

**Key differentiators:**
1. Breadth of actions (not just browser)
2. Safety-first design with clear controls
3. Memory that persists and learns
4. Voice + phone integration native
5. Transparent about what it's doing

---

## 10. Launch Phases

### Phase 1: Foundation (Month 1-2)
- Web chat UI
- Core messaging (email, Slack, Discord)
- Calendar integration
- Basic memory
- Safety framework

### Phase 2: Expansion (Month 3-4)
- Task management integrations
- Browser automation (sandboxed)
- Voice chat
- Mobile app (iOS)

### Phase 3: Power Features (Month 5-6)
- Phone calling
- Workflow builder
- Team features
- Desktop app

### Phase 4: Enterprise (Month 7+)
- SSO/SAML
- Compliance certifications
- On-prem option
- Custom integrations

---

## 11. Open Questions

1. **Branding**: Is "Mantis" the right name? (Trademark check needed)
2. **Model flexibility**: Let users bring their own API keys?
3. **White-label**: Offer as platform for other companies?
4. **Mobile-first**: Should mobile be prioritized over desktop?
5. **Pricing**: Is $20/mo the right price point?

---

## 12. Success Metrics

### User Metrics
- DAU/MAU ratio (target: >40%)
- Actions per user per day (target: >10)
- Retention (30-day: >60%, 90-day: >40%)

### Safety Metrics
- False positive rate on confirmations (target: <5%)
- User override rate (should decrease over time)
- Safety incidents (target: 0 critical)

### Business Metrics
- Conversion free→paid (target: >5%)
- Churn rate (target: <5%/month)
- NPS (target: >50)

---

## 13. Appendix: Full Feature List from OpenClaw

### Proven/Working Integrations
*(Based on existing OpenClaw skills and capabilities)*

**Communication:**
- iMessage, Signal, WhatsApp, Telegram, Discord, Slack, MS Teams, Google Chat, Matrix, Mattermost

**Productivity:**
- Apple Reminders, Apple Notes, Notion, Obsidian, Bear Notes, Trello, Things (Mac)

**Developer:**
- GitHub (full gh CLI), code execution, file management

**Media:**
- Spotify, Sonos, Apple Music

**Smart Home:**
- Philips Hue (OpenHue)

**Utilities:**
- 1Password (secrets management), Weather, Web search

**Voice:**
- TTS (ElevenLabs, OpenAI), Voice calls (Twilio/Telnyx/Plivo)

**Advanced:**
- Browser automation (Playwright), Camera/screen capture (nodes), Cron scheduling, Multi-agent coordination

---

*This is a living document. Update as we learn more.*
