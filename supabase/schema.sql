-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.workflow_lock (
  id integer NOT NULL DEFAULT 1,
  is_processing boolean DEFAULT false,
  locked_at timestamp with time zone,
  is_confirming boolean,
  chat_id bigint,
  CONSTRAINT workflow_lock_pkey PRIMARY KEY (id)
);
CREATE TABLE public.pending_orders (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  chat_id bigint,
  message_id bigint,
  customer_name text,
  po_number text,
  po_date date,
  delivery_date date,
  delivery_address text,
  currency text,
  confidence text,
  confidence_reason text,
  unreadable_fields text,
  items jsonb,
  po_data jsonb,
  created_at timestamp with time zone DEFAULT now(),
  CONSTRAINT pending_orders_pkey PRIMARY KEY (id)
);
CREATE TABLE public.purchase_orders (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  customer_name text,
  po_number text,
  po_date date,
  delivery_date date,
  delivery_address text,
  items jsonb,
  total numeric,
  confidence text CHECK (confidence = ANY (ARRAY['high'::text, 'medium'::text, 'low'::text])),
  confidence_reason text,
  created_at timestamp with time zone DEFAULT now(),
  CONSTRAINT purchase_orders_pkey PRIMARY KEY (id)
);