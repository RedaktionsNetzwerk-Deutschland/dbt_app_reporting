with os_version_report as ( --unused

    select *
    from {{ ref('apple_store__platform_version_report') }}
),

subsetted as (

    select 
        date_day,
        'apple_store' as app_platform,
        app_name, 
        platform_version as os_version,
        sum(total_downloads) as total_downloads,
        sum(first_time_downloads) as first_time_downloads,
        sum(redownloads) as redownloads,
        sum(deletions) as deletions,
        sum(crashes) as crashes
    from os_version_report
    {{ dbt_utils.group_by(4) }}
)

select * 
from subsetted