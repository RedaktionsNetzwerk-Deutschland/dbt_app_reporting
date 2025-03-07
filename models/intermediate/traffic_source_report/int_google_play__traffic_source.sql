with traffic_source_report as (

    select *
    from {{ ref('stg_google_play__store_performance_source') }}
),

adapter as (

    select 
        date_day,
        'google_play' as app_platform,
        package_name as app_name,
        traffic_source as traffic_source_type,
        sum(coalesce(store_listing_acquisitions, 0)) as user_acquisitions,
        CAST(NULL as int64) as total_downloads,
        sum(coalesce(store_listing_visitors, 0)) as page_views
    from traffic_source_report
    {{ dbt_utils.group_by(n=4) }}
)

select * 
from adapter