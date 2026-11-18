# 🧱 harsh_dbt_youtube: the dbt project

This folder is the dbt project behind the [medallion analytics repo](../README.md): retail sales and returns data on Databricks, modeled as **🥉 Bronze → 🥈 Silver → 🥇 Gold**.

## Quick start

```bash
cp profiles.yml.example ~/.dbt/profiles.yml   # add your Databricks host, http_path and token
dbt debug       # verify the connection
dbt seed        # load seeds/lookup.csv
dbt run         # build bronze, silver and gold models
dbt test        # run generic + singular data tests
dbt snapshot    # capture history for gold_items (SCD2)
```

## Layout

| Path | Purpose |
|---|---|
| `models/source/` | Source table definitions |
| `models/bronze/` | 1:1 staging tables and their tests (`properties.yml`) |
| `models/silver/` | Joined and enriched models |
| `models/gold/` | Business-ready models |
| `snapshots/` | `gold_items` SCD Type 2 snapshot |
| `seeds/` | Static reference data |
| `macros/` | Reusable Jinja macros |
| `tests/` | Singular data tests |
| `analyses/` | Jinja experiments and ad-hoc queries |

> 🔐 `profiles.yml` holds secrets and is git-ignored. Only `profiles.yml.example` is committed.

## Resources

- [dbt docs](https://docs.getdbt.com/docs/introduction)
- [dbt Databricks adapter](https://docs.getdbt.com/docs/core/connect-data-platform/databricks-setup)
- [dbt Community Slack](https://community.getdbt.com/)
