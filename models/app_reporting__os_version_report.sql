with unioned as ( --unused

    {{ dbt_utils.union_relations(relations=[ref('int_apple_store__os_version'), ref('int_google_play__os_version')]) }}
),

final as (

    select 
        date_day,
        app_platform,
        app_name, 
        os_version,
        first_time_downloads,
        redownloads,
        total_downloads,
        deletions,
        crashes
    from unioned
)

select * 
from final