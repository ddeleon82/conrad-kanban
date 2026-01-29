#!/bin/bash
# Update Conrad's agent status on the kanban board
# Usage: ./update-status.sh <status> [current_task]
# Status: online | working | idle | offline
# Example: ./update-status.sh working "Building NakamaOS"

SUPABASE_URL="https://sgcynfmkhqowdboweahz.supabase.co"
ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNnY3luZm1raHFvd2Rib3dlYWh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg3Nzg0OTYsImV4cCI6MjA4NDM1NDQ5Nn0.adsPZ0U_Ce2oM7MWaczBN9sqjVGhFfaht01eBktD6As"

STATUS="${1:-online}"
TASK="${2:-null}"
READY="true"
if [ "$STATUS" = "working" ] || [ "$STATUS" = "busy" ]; then
  READY="false"
  STATUS="working"
fi

# Auth first
AUTH=$(curl -s "$SUPABASE_URL/auth/v1/token?grant_type=password" \
  -H "apikey: $ANON_KEY" \
  -H "Content-Type: application/json" \
  -d '{"email":"conrad@freedomandcoffee.co","password":"ConradKanban2026!"}')

TOKEN=$(echo "$AUTH" | python3 -c "import sys,json; print(json.load(sys.stdin)['access_token'])" 2>/dev/null)

if [ -z "$TOKEN" ]; then
  echo "Auth failed"
  exit 1
fi

# Build JSON
if [ "$TASK" = "null" ]; then
  BODY="{\"status\":\"$STATUS\",\"ready_for_tasks\":$READY,\"last_heartbeat\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"current_task\":null}"
else
  BODY="{\"status\":\"$STATUS\",\"ready_for_tasks\":$READY,\"last_heartbeat\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"current_task\":\"$TASK\"}"
fi

# Upsert
curl -s "$SUPABASE_URL/rest/v1/agent_status?id=eq.conrad" \
  -X PATCH \
  -H "apikey: $ANON_KEY" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -H "Prefer: return=minimal" \
  -d "$BODY"

echo "✓ Status: $STATUS | Task: $TASK | Ready: $READY"
