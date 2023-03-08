with os_version_report as ( -- unused

    select *
    from {{ ref('google_play__os_version_report') }}
),

adapter as (

    select 
        date_day,
        'google_play' as app_platform,
        package_name as app_name,
        android_os_version as os_version,
        device_uninstalls as deletions,
        device_installs as first_time_downloads,
        install_events as total_downloads,
        install_events - device_installs as redownloads,
        crashes
    from os_version_report
)

select * 
from adapter