with unioned as (

    {{ dbt_utils.union_relations(relations=[ref('int_apple_store__country'), ref('int_google_play__country')]) }}
),

final as (

    select
        date_day,
        app_platform,
        app_name, 
        country_long,
        country_short,
        region,
        sub_region,
        first_time_downloads,
        redownloads,
        total_downloads,
        deletions,
        page_views,
        user_acquisitions
    from unioned
)

select * 
from final