# Luna AI — Your AI Wellness Copilot

AI-powered women's wellness copilot combining menstrual cycle tracking, wellness insights, predictive analytics, and agentic task management.

## Features

- **Cycle-aware AI Copilot** — Chat with Luna for personalized wellness guidance
- **Agentic Task Creation** — AI extracts tasks from natural conversation (requires approval)
- **Voice Assistant** — Speak naturally, get task suggestions
- **Wellness Dashboard** — Phase tracking, wellness score, predictions
- **Invisible Journaling** — Mood/energy/stress extracted from chat
- **Wellness Twin** — Personalized insights from your data
- **Future Self Predictions** — Rule-based energy/mood/stress forecasts

## Quick Start (Demo Mode)

Works out of the box without API keys:

```bash
cd luna_ai
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Sign in with any email/password in demo mode.

## Production Setup

1. Copy `.env.example` to `.env` and fill in credentials:

```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
GEMINI_API_KEY=your-gemini-api-key
```

2. Run Supabase migrations:

```bash
supabase db push
```

3. Deploy edge function (optional, for server-side Gemini):

```bash
supabase functions deploy gemini-chat
```

## Tech Stack

- Flutter + Riverpod + GoRouter + Freezed
- Supabase (Auth, Database, Realtime, Edge Functions)
- Gemini 2.5 Flash API
- speech_to_text for voice

## Demo Flow

1. Sign up / Sign in
2. Complete onboarding (cycle data + goals)
3. Open Dashboard — see phase, wellness score, predictions
4. Chat: *"I have an exam next week and need to exercise more"*
5. Review AI Suggestions → Approve tasks
6. Complete tasks in Task Manager

## Architecture

```
lib/
├── core/           # Config, theme, router, widgets
├── features/       # Feature-first screens
└── shared/         # Models, repositories, services, providers
```
