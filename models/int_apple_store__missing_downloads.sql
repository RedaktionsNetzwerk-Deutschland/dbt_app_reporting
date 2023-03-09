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
        sum(page_views) as page_views
    from country_report
    {{ dbt_utils.group_by(7) }}
),

country_report_summed as (
    select
        date_day,
        app_platform,
        app_name,
        sum(first_time_downloads) as first_time_downloads,
        sum(redownloads) as redownloads,
        sum(total_downloads) as total_downloads,
        sum(deletions) as deletions,
        sum(page_views) as page_views
    from subsetted
    group by date_day, app_platform, app_name
),

downloads_overview as (
    select *
    from {{ ref('app_reporting__overview_report') }}
    where app_platform = 'apple_store'
)

select 
        o.date_day as date_day,
        'apple_store' as app_platform,
        o.app_name as app_name,
        CAST(NULL as string) as country_long,
        CAST(NULL as string) as country_short,
        CAST(NULL as string) as region,
        CAST(NULL as string) as sub_region,
        (o.first_time_downloads - COALESCE(t.first_time_downloads,0)) as first_time_downloads,
        (o.redownloads - COALESCE(t.redownloads,0)) as redownloads,
        (o.total_downloads - COALESCE(t.total_downloads,0)) as total_downloads,
        0 as deletions,
        0 as page_views
    from downloads_overview o left join country_report_summed t on(o.date_day = t.date_day and o.app_name = t.app_name)