CREATE TABLE IF NOT EXISTS queries
(
    queryid String COMMENT 'hash of query fingerprint',
    d_server String COMMENT 'domention: IP or hostname of DB server',
    d_database String COMMENT 'PostgreSQL: database',
    d_schema String COMMENT 'MySQL: database; PostgreSQL: schema',
    d_username String COMMENT 'client user name',
    d_client_host String COMMENT 'client IP or hostname',
    `labels.key` Array(String) COMMENT 'Custom labels names',
    `labels.value` Array(String) COMMENT 'Custom labels values',
    agent_uuid String COMMENT 'Identifier of agent that collect and send metrics',
    metrics_source String COMMENT 'Ex.: slowlog, perf schema, Mongo DB, Percona Server, etc',
    period_start DateTime COMMENT 'Time when collection of bucket started',
    period_length UInt32 COMMENT 'Duration of collection bucket',
    fingerprint String COMMENT 'mysql digest_text; query without data',
    example String COMMENT 'One of query example from set found in bucket',
    example_format Enum8('EXAMPLE' = 1, 'DIGEST' = 2) COMMENT 'Indicates that collect real query examples is prohibited',
    is_truncated UInt8 COMMENT 'Indicates if query examples is too long and was truncated',
    example_type Enum8('RANDOM' = 1, 'SLOWEST' = 2, 'FASTEST' = 3, 'WITH_ERROR' = 4) COMMENT 'Indicates what query example was picked up',
    example_metrics String COMMENT 'JSON raw metrics for given query example',
    num_queries_with_warnings Float32 COMMENT 'How many queries was with warnings in bucket',
    `warnings.code` Array(UInt32) COMMENT 'List of warnings',
    `warnings.count` Array(Float32) COMMENT 'Amount of each warnings in bucket',
    num_queries_with_errors Float32 COMMENT 'How many queries was with error in bucket',
    `errors.code` Array(UInt32) COMMENT 'List of Last_errno',
    `errors.count` Array(Float32) COMMENT 'Amount of each Last_errno in bucket',
    num_queries Float32 COMMENT 'Amount queries in this bucket',
    -- metrics
    m_query_time_cnt Float32 COMMENT 'How many times query_time was found',
    m_query_time_sum Float32 COMMENT 'Sum of all values query_time in bucket',
    m_query_time_min Float32 COMMENT 'Smallest value of query_time in bucket',
    m_query_time_max Float32 COMMENT 'Biggest value of query_time in bucket',
    m_query_time_p99 Float32 COMMENT '99 percentile of value of query_time in bucket',
    m_lock_time_cnt Float32,
    m_lock_time_sum Float32,
    m_lock_time_min Float32,
    m_lock_time_max Float32,
    m_lock_time_p99 Float32,
    m_rows_sent_cnt Float32,
    m_rows_sent_sum Float32,
    m_rows_sent_min Float32,
    m_rows_sent_max Float32,
    m_rows_sent_p99 Float32,
    m_rows_examined_cnt Float32,
    m_rows_examined_sum Float32,
    m_rows_examined_min Float32,
    m_rows_examined_max Float32,
    m_rows_examined_p99 Float32,
    m_rows_affected_cnt Float32,
    m_rows_affected_sum Float32,
    m_rows_affected_min Float32,
    m_rows_affected_max Float32,
    m_rows_affected_p99 Float32,
    m_rows_read_cnt Float32,
    m_rows_read_sum Float32,
    m_rows_read_min Float32,
    m_rows_read_max Float32,
    m_rows_read_p99 Float32,
    m_merge_passes_cnt Float32,
    m_merge_passes_sum Float32,
    m_merge_passes_min Float32,
    m_merge_passes_max Float32,
    m_merge_passes_p99 Float32,
    m_innodb_io_r_ops_cnt Float32,
    m_innodb_io_r_ops_sum Float32,
    m_innodb_io_r_ops_min Float32,
    m_innodb_io_r_ops_max Float32,
    m_innodb_io_r_ops_p99 Float32,
    m_innodb_io_r_bytes_cnt Float32,
    m_innodb_io_r_bytes_sum Float32,
    m_innodb_io_r_bytes_min Float32,
    m_innodb_io_r_bytes_max Float32,
    m_innodb_io_r_bytes_p99 Float32,
    m_innodb_io_r_wait_cnt Float32,
    m_innodb_io_r_wait_sum Float32,
    m_innodb_io_r_wait_min Float32,
    m_innodb_io_r_wait_max Float32,
    m_innodb_io_r_wait_p99 Float32,
    m_innodb_rec_lock_wait_cnt Float32,
    m_innodb_rec_lock_wait_sum Float32,
    m_innodb_rec_lock_wait_min Float32,
    m_innodb_rec_lock_wait_max Float32,
    m_innodb_rec_lock_wait_p99 Float32,
    m_innodb_queue_wait_cnt Float32,
    m_innodb_queue_wait_sum Float32,
    m_innodb_queue_wait_min Float32,
    m_innodb_queue_wait_max Float32,
    m_innodb_queue_wait_p99 Float32,
    m_innodb_pages_distinct_cnt Float32,
    m_innodb_pages_distinct_sum Float32,
    m_innodb_pages_distinct_min Float32,
    m_innodb_pages_distinct_max Float32,
    m_innodb_pages_distinct_p99 Float32,
    m_query_length_cnt Float32,
    m_query_length_sum Float32,
    m_query_length_min Float32,
    m_query_length_max Float32,
    m_query_length_p99 Float32,
    m_bytes_sent_cnt Float32,
    m_bytes_sent_sum Float32,
    m_bytes_sent_min Float32,
    m_bytes_sent_max Float32,
    m_bytes_sent_p99 Float32,
    m_tmp_tables_cnt Float32,
    m_tmp_tables_sum Float32,
    m_tmp_tables_min Float32,
    m_tmp_tables_max Float32,
    m_tmp_tables_p99 Float32,
    m_tmp_disk_tables_cnt Float32,
    m_tmp_disk_tables_sum Float32,
    m_tmp_disk_tables_min Float32,
    m_tmp_disk_tables_max Float32,
    m_tmp_disk_tables_p99 Float32,
    m_tmp_table_sizes_cnt Float32,
    m_tmp_table_sizes_sum Float32,
    m_tmp_table_sizes_min Float32,
    m_tmp_table_sizes_max Float32,
    m_tmp_table_sizes_p99 Float32,
    m_qc_hit_cnt Float32 COMMENT 'Boolean metrics',
    m_qc_hit_sum Float32 COMMENT '%true = sum/cnt',
    m_full_scan_cnt Float32,
    m_full_scan_sum Float32,
    m_full_join_cnt Float32,
    m_full_join_sum Float32,
    m_tmp_table_cnt Float32,
    m_tmp_table_sum Float32,
    m_tmp_table_on_disk_cnt Float32,
    m_tmp_table_on_disk_sum Float32,
    m_filesort_cnt Float32,
    m_filesort_sum Float32,
    m_filesort_on_disk_cnt Float32,
    m_filesort_on_disk_sum Float32,
    m_select_full_range_join_cnt Float32,
    m_select_full_range_join_sum Float32,
    m_select_range_cnt Float32,
    m_select_range_sum Float32,
    m_select_range_check_cnt Float32,
    m_select_range_check_sum Float32,
    m_sort_range_cnt Float32,
    m_sort_range_sum Float32,
    m_sort_rows_cnt Float32,
    m_sort_rows_sum Float32,
    m_sort_scan_cnt Float32,
    m_sort_scan_sum Float32,
    m_no_index_used_cnt Float32,
    m_no_index_used_sum Float32,
    m_no_good_index_used_cnt Float32,
    m_no_good_index_used_sum Float32,
    -- mongo metrics
    m_docs_returned_cnt Float32,
    m_docs_returned_sum Float32,
    m_docs_returned_min Float32,
    m_docs_returned_max Float32,
    m_docs_returned_p99 Float32,
    m_response_length_cnt Float32,
    m_response_length_sum Float32,
    m_response_length_min Float32,
    m_response_length_max Float32,
    m_response_length_p99 Float32,
    m_docs_scanned_cnt Float32,
    m_docs_scanned_sum Float32,
    m_docs_scanned_min Float32,
    m_docs_scanned_max Float32,
    m_docs_scanned_p99 Float32
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(period_start)
ORDER BY (queryid, d_server, d_database, d_schema, d_username, d_client_host, period_start);
