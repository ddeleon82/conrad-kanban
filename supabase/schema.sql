-- Conrad's Kanban Board - Supabase Schema
-- Run this in the Supabase SQL Editor

-- Tasks table
CREATE TABLE IF NOT EXISTS tasks (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  column_id TEXT NOT NULL DEFAULT 'backlog',
  assignee TEXT NOT NULL DEFAULT 'conrad',
  priority TEXT DEFAULT 'medium',
  deliverable TEXT,
  notes TEXT,
  completed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Comments table
CREATE TABLE IF NOT EXISTS comments (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  task_id UUID REFERENCES tasks(id) ON DELETE CASCADE,
  author TEXT NOT NULL,
  text TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Activity log
CREATE TABLE IF NOT EXISTS activity (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  task_id UUID REFERENCES tasks(id) ON DELETE SET NULL,
  action TEXT NOT NULL,
  task_title TEXT,
  actor TEXT NOT NULL,
  details JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE tasks ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE activity ENABLE ROW LEVEL SECURITY;

-- Public read/write policies (for now - tighten later if needed)
CREATE POLICY "Public read tasks" ON tasks FOR SELECT USING (true);
CREATE POLICY "Public insert tasks" ON tasks FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update tasks" ON tasks FOR UPDATE USING (true);
CREATE POLICY "Public delete tasks" ON tasks FOR DELETE USING (true);

CREATE POLICY "Public read comments" ON comments FOR SELECT USING (true);
CREATE POLICY "Public insert comments" ON comments FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update comments" ON comments FOR UPDATE USING (true);
CREATE POLICY "Public delete comments" ON comments FOR DELETE USING (true);

CREATE POLICY "Public read activity" ON activity FOR SELECT USING (true);
CREATE POLICY "Public insert activity" ON activity FOR INSERT WITH CHECK (true);

-- Index for faster queries
CREATE INDEX IF NOT EXISTS idx_tasks_column ON tasks(column_id);
CREATE INDEX IF NOT EXISTS idx_comments_task ON comments(task_id);
CREATE INDEX IF NOT EXISTS idx_activity_task ON activity(task_id);
CREATE INDEX IF NOT EXISTS idx_activity_created ON activity(created_at DESC);

-- Function to auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tasks_updated_at
  BEFORE UPDATE ON tasks
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

-- Enable realtime for tasks and comments
ALTER PUBLICATION supabase_realtime ADD TABLE tasks;
ALTER PUBLICATION supabase_realtime ADD TABLE comments;

-- Agent Status table for sidebar presence indicator
CREATE TABLE IF NOT EXISTS agent_status (
  id TEXT PRIMARY KEY DEFAULT 'conrad',
  status TEXT NOT NULL DEFAULT 'offline',
  current_task TEXT,
  ready_for_tasks BOOLEAN NOT NULL DEFAULT true,
  last_heartbeat TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE agent_status ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read agent_status" ON agent_status FOR SELECT USING (true);
CREATE POLICY "Public insert agent_status" ON agent_status FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update agent_status" ON agent_status FOR UPDATE USING (true);
ALTER PUBLICATION supabase_realtime ADD TABLE agent_status;

CREATE TRIGGER agent_status_updated_at
  BEFORE UPDATE ON agent_status
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

INSERT INTO agent_status (id, status, current_task, ready_for_tasks)
VALUES ('conrad', 'online', NULL, true)
ON CONFLICT (id) DO NOTHING;
