{% docs date_day %} The date of the report and respective recorded metric(s); follows the format YYYY-MM-DD. {% enddocs %}

{% docs app_name %} Application Name. {% enddocs %}

{% docs app_platform %} The name of the App Platform and will either be 'apple_store' or 'google_play.' {% enddocs %}

{% docs app_version %} The app version of the app that the user is engaging with. {% enddocs %}

{% docs country_long %} The long country name for this record; a handful of countries will have names specific to the Apple App Store, while most will align completely with ISO-3166 naming conventions. {% enddocs %}

{% docs country_short %} The short 2-character name for this record's country; countries that are not officially included in ISO-3166 are not included. For example, Google Play includes records from two unofficial ISO-3166 countries, XK and AN. {% enddocs %}

{% docs crashes %} The number of recorded crashes experienced (User Opt-In only); a value of 0 indicates there were 0 crash reports or no values from the source report that day. {% enddocs %}

{% docs deletions %} A deletion occurs when a user removes your app from their device (User Opt-In only). A value of 0 indicates there were 0 deletions or no values from the source report that day. {% enddocs %}

{% docs device %} Device type associated with the respective metric(s). {% enddocs %}

{% docs first_time_downloads %} The number of devices which installed the app for the first time. This includes devices activations having the app preinstalled. {% enddocs %}

{% docs total_downloads %} The number of times the app got installed. This includes devices reinstalling the application but excludes devices (re-)activations having the app preinstalled. {% enddocs %}

{% docs redownloads %} total_downloads - first_time_downloads: This is an lower bound for the number of devices which reinstalled the app. Specifically it is the number of redownloads not counting reactivation of old devices with the app preinstalled, minus fresh devices having the app preinstalled. {% enddocs %}

{% docs user_acquisitions %} The number of users, which installed or reinstalled the app after visiting the store page. The app was not installed on any other device of the user. {% enddocs %}

{% docs page_views %} The number of times your app listing was viewed. {% enddocs %}

{% docs os_version %} The operating system version of the device engaging with your app. {% enddocs %}

{% docs region %} The UN Statistics region name assignment. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs %}

{% docs sub_region %} The UN Statistics sub-region name. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs%}

{% docs traffic_source_type %} The original source that was credited for directing traffic to your target (e.g. directed users to a page view or a download). For detailed descriptions, please refer to the [Apple App Store](https://github.com/fivetran/dbt_apple_store_source/blob/main/models/docs.md?plain=1#L72-L82) or [Google Play](https://github.com/fivetran/dbt_google_play_source/blob/main/models/docs.md?plain=1#L116) docs. {% enddocs %}