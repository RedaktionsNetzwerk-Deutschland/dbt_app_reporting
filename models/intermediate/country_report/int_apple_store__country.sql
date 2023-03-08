with country_report as (

    select *
    from {{ ref('apple_store__territory_report') }}
),

country_report_summed as (
    select
        date_day,
        app_name,
        sum(first_time_downloads) as first_time_downloads,
        sum(redownloads) as redownloads,
        sum(total_downloads) as total_downloads
    from country_report
    group by date_day, app_name
),

downloads_overview as (
    select *
    from {{ ref('app_reporting__overview_report') }}
),

country_report_missing_downloads as (
    select 
        COALESCE(t.date_day, o.date_day), 
        COALESCE(t.app_name, o.app_name),
        "Unavailable" as source_type,
        NULL as territory,
        (o.first_time_downloads - COALESCE(t.first_time_downloads,0)) as first_time_downloads,
        (o.redownloads - COALESCE(t.redownloads,0)) as redownloads,
        (o.total_downloads - COALESCE(t.total_downloads,0)) as total_downloads
    from downloads_overview o left join country_report_summed t on(o.date_day = t.date_day and o.app_name = t.app_name)
)

country_report_filled as (
    select * from country_report
    union all
    select * from country_report_missing_downloads
    where first_time_downloads > 0 or redownloads > 0 or total_downloads > 0
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
    from country_report_filled
    {{ dbt_utils.group_by(7) }}
)

select * 
from subsetted