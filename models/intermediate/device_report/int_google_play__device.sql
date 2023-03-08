with device_report as (

    select *
    from {{ ref('google_play__device_report') }}
),

adapter as (

    select 
        date_day,
        'google_play' as app_platform,
        package_name as app_name,
        device,
        device_uninstalls as deletions,
        device_installs as first_time_downloads,
        install_events as total_downloads,
        install_events - device_installs as redownloads
    from device_report
)

select * 
from adapter