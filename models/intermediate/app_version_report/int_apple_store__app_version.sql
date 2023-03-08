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
        CAST(NULL as int64) as first_time_downloads,
        CAST(NULL as int64) as redownloads,
        CAST(NULL as int64) as total_downloads,
        sum(deletions) as deletions,
        sum(crashes) as crashes
    from app_version_report
    {{ dbt_utils.group_by(4) }}
)

select * 
from subsetted