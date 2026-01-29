-- Agent Status table for Conrad's sidebar presence indicator
-- Run this in Supabase SQL Editor

CREATE TABLE IF NOT EXISTS agent_status (
  id TEXT PRIMARY KEY DEFAULT 'conrad',
  status TEXT NOT NULL DEFAULT 'offline',        -- online, working, idle, offline
  current_task TEXT,                               -- what Conrad is working on
  ready_for_tasks BOOLEAN NOT NULL DEFAULT true,
  last_heartbeat TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE agent_status ENABLE ROW LEVEL SECURITY;

-- Public read/write policies
CREATE POLICY "Public read agent_status" ON agent_status FOR SELECT USING (true);
CREATE POLICY "Public insert agent_status" ON agent_status FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update agent_status" ON agent_status FOR UPDATE USING (true);

-- Enable realtime
ALTER PUBLICATION supabase_realtime ADD TABLE agent_status;

-- Insert default row for Conrad
INSERT INTO agent_status (id, status, current_task, ready_for_tasks)
VALUES ('conrad', 'online', 'Setting up kanban sidebar', true)
ON CONFLICT (id) DO NOTHING;
