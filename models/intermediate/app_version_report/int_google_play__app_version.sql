with app_version_report as (

    select *
    from {{ ref('google_play__app_version_report') }}
),

adapter as (

    select 
        date_day,
        'google_play' as app_platform,
        package_name as app_name,
        app_version_code as app_version,
        device_installs as first_time_downloads,
        install_events as total_downloads,
        install_events - device_installs as redownloads,
        device_uninstalls as deletions,
        crashes
    from app_version_report
)

select * 
from adapter