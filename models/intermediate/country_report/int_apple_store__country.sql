with country_report as (

    select *
    from {{ ref('apple_store__territory_report') }}
),

country_report_missing_downloads as (

    select * 
    from {{ ref('int_apple_store__missing_downloads') }}
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
        sum(page_views) as page_views
    from country_report
    {{ dbt_utils.group_by(7) }}
),

country_report_filled as (
    select * from subsetted
    union all
    select * from country_report_missing_downloads
    where first_time_downloads > 0 or redownloads > 0 or total_downloads > 0
)

select * 
from country_report_filled