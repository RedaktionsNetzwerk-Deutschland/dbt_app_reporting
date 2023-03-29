with overview_report as (

    select *
    from {{ ref('apple_store__overview_report') }}
),

subsetted as (

    select 
        date_day,
        'apple_store' as app_platform,
        app_name,
        first_time_downloads,
        redownloads, 
        total_downloads,
        deletions,
        page_views,
        CAST(NULL as int64) as user_acquisitions,
        crashes
    from overview_report
)

select * 
from subsetted