I represent a EXCLUDE constraint as defined in SQL standard.

Example:

ALTER TABLE vcp.attachments
ADD CONSTRAINT unique_vcp_attachment_task_constr
EXCLUDE USING gist (dataset_id WITH =, metric_id WITH =, location_id WITH =,
   period_type WITH =, user_id WITH =, assignee_id WITH =,
  tstzrange(start_time, expiration_time, '()') WITH &&)
WHERE (attachment_type = 'vcp-task');