with overview_report as (

    select *
    from {{ ref('google_play__overview_report') }}
),

adapter as (

    select 
        date_day,
        'google_play' as app_platform,
        package_name as app_name,
        device_installs as first_time_downloads,
        install_events - device_installs as redownloads,
        install_events as total_downloads,
        uninstall_events as deletions,
        store_listing_visitors as page_views,
        store_listing_acquisitions as user_acquisitions,
        crashes
    from overview_report
)

select * 
from adapter