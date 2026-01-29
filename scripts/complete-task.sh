#!/bin/bash
# Move a kanban task to "done" column
# Usage: ./complete-task.sh <task_id>

SUPABASE_URL="https://sgcynfmkhqowdboweahz.supabase.co"
ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNnY3luZm1raHFvd2Rib3dlYWh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg3Nzg0OTYsImV4cCI6MjA4NDM1NDQ5Nn0.adsPZ0U_Ce2oM7MWaczBN9sqjVGhFfaht01eBktD6As"

TASK_ID="$1"
if [ -z "$TASK_ID" ]; then
  echo "Usage: $0 <task_id>"
  exit 1
fi

# Auth
AUTH=$(curl -s "$SUPABASE_URL/auth/v1/token?grant_type=password" \
  -H "apikey: $ANON_KEY" \
  -H "Content-Type: application/json" \
  -d '{"email":"conrad@freedomandcoffee.co","password":"ConradKanban2026!"}')

TOKEN=$(echo "$AUTH" | python3 -c "import sys,json; print(json.load(sys.stdin)['access_token'])" 2>/dev/null)

if [ -z "$TOKEN" ]; then
  echo "Auth failed"
  exit 1
fi

# Move to done
NOW=$(date -u +%Y-%m-%dT%H:%M:%SZ)
curl -s "$SUPABASE_URL/rest/v1/tasks?id=eq.$TASK_ID" \
  -X PATCH \
  -H "apikey: $ANON_KEY" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -H "Prefer: return=representation" \
  -d "{\"column\":\"done\",\"completedAt\":\"$NOW\"}"

echo "✓ Task $TASK_ID moved to done"
