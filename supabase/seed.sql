-- Seed existing tasks into Supabase
-- Run this AFTER schema.sql

INSERT INTO tasks (id, title, description, column_id, assignee, priority, deliverable, notes, completed_at) VALUES
  ('00000000-0000-0000-0000-000000000001', 'Build Kanban Board', NULL, 'done', 'conrad', 'high', 'https://ddeleon82.github.io/conrad-kanban', 'Live kanban board with drag-drop, dark mode, priority badges. Local: /clawd/kanban/', '2026-01-26T03:35:00Z'),
  ('00000000-0000-0000-0000-000000000002', 'CloseBot Replacement - PRD', NULL, 'done', 'conrad', 'high', 'https://github.com/ddeleon82/conrad-kanban/blob/main/docs/closebot-replacement-prd.md', NULL, '2026-01-26T04:05:00Z'),
  ('00000000-0000-0000-0000-000000000003', 'Secure Password Sharing Research', NULL, 'done', 'conrad', 'medium', 'https://github.com/ddeleon82/conrad-kanban/blob/main/docs/secure-password-sharing.md', NULL, '2026-01-26T03:55:00Z'),
  ('00000000-0000-0000-0000-000000000004', 'Client Dashboard - PRD', NULL, 'done', 'conrad', 'high', 'https://github.com/ddeleon82/conrad-kanban/blob/main/docs/client-dashboard-prd.md', NULL, '2026-01-26T04:10:00Z'),
  ('00000000-0000-0000-0000-000000000005', 'Notion Agency Dashboard Review', NULL, 'done', 'conrad', 'medium', 'https://github.com/ddeleon82/conrad-kanban/blob/main/docs/notion-dashboard-review.md', NULL, '2026-01-26T22:20:00Z'),
  ('00000000-0000-0000-0000-000000000006', '10 Ways Conrad Can Help Dom', NULL, 'done', 'conrad', 'medium', 'https://github.com/ddeleon82/conrad-kanban/blob/main/docs/10-ways-conrad-can-help.md', NULL, '2026-01-26T03:50:00Z'),
  ('00000000-0000-0000-0000-000000000007', 'Terreform Sizzle Reel Script', '2-minute ''What If'' script for Terreform ONE nonprofit. Research + script + Frameset reference terms.', 'done', 'conrad', 'high', 'https://github.com/ddeleon82/conrad-kanban/blob/main/docs/terreform-sizzle-script.md', NULL, '2026-01-26T04:15:00Z'),
  ('00000000-0000-0000-0000-000000000008', 'Set up Daily Digest System', 'Create automated morning digest: high-value tasks, responses needed, calendar summary', 'todo', 'conrad', 'high', NULL, NULL, NULL),
  ('00000000-0000-0000-0000-000000000009', 'Set up Notion API for Conrad', 'Create integration, get API key, share relevant pages', 'done', 'dom', 'medium', NULL, 'Notion integration ''Conrad'' connected to Freedom & Coffee workspace', '2026-01-26T22:04:00Z'),
  ('00000000-0000-0000-0000-000000000010', 'Pull Frameset Reference Stills', 'Complete Frameset login, search terms in script doc', 'todo', 'dom', 'medium', NULL, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
