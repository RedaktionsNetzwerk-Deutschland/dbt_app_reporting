with unioned as (

    {{ dbt_utils.union_relations(relations=[ref('int_apple_store__traffic_source'), ref('int_google_play__traffic_source')]) }}
),

final as (

    select
        date_day,
        app_platform,
        app_name,
        traffic_source_type,
        total_downloads,
        user_acquisitions,
        page_views
    from unioned
)

select * 
from final