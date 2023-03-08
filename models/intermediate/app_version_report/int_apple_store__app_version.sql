with app_version_report as (

    select *
    from {{ ref('apple_store__app_version_report') }}
),

subsetted as (

    select 
        date_day,
        'apple_store' as app_platform,
        app_name, 
        app_version,
        sum(first_time_downloads) as first_time_downloads,
        sum(redownloads) as redownloads,
        sum(total_downloads) as total_downloads,
        sum(deletions) as deletions,
        sum(crashes) as crashes
    from app_version_report
    {{ dbt_utils.group_by(4) }}
)

select * 
from subsetted