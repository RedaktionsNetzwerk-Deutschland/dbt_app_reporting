with country_report as (

    select *
    from {{ ref('apple_store__territory_report') }}
),

subsetted as (

    select 
        date_day,
        'apple_store' as app_platform,
        app_name, 
        territory_long as country_long,
        territory_short as country_short,
        region,
        sub_region,
        sum(first_time_downloads) as first_time_downloads,
        sum(redownloads) as redownloads,
        sum(total_downloads) as total_downloads,
        sum(deletions) as deletions,
        sum(page_views) as page_views,
        CAST(NULL as int64) as user_acquisitions
    from country_report
    {{ dbt_utils.group_by(7) }}
)

select * 
from subsetted