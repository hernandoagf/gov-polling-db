CREATE SCHEMA esm;

CREATE TABLE esm.mkr_joins (
  id         serial primary key,
  from_address             character varying(66) not null,
  immediate_caller    character varying(66) not null,
  join_amount       decimal(78,18) not null,
  contract_address    character varying(66) not null,
  
  log_index  integer not null,
  tx_id      integer not null REFERENCES vulcan2x.transaction(id) ON DELETE CASCADE,
  block_id   integer not null REFERENCES vulcan2x.block(id) ON DELETE CASCADE,
  unique (log_index, tx_id)
);