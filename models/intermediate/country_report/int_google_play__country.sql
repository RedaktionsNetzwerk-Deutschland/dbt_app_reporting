with country_report as (

    select *
    from {{ ref('google_play__country_report') }}
),

adapter as (

    select 
        date_day,
        'google_play' as app_platform,
        package_name as app_name,
        country_long,
        country_short,
        region,
        sub_region,
        device_uninstalls as deletions,
        device_installs as first_time_downloads,
        install_events as total_downloads,
        install_events - device_installs as redownloads,
        store_listing_visitors as page_views,
        store_listing_acquisitions as user_acquisitions
    from country_report
)

select * 
from adapter