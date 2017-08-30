connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=4.20
# NOTE: for BigQuery specific considerations

explore: orders {
  join: order_items {
    view_label: "Orders"
    relationship: one_to_many
    sql_on: ${orders.id} = ${order_items.order_id};;
  }
  join: inventory_items {
    view_label: "Orders"
    relationship: one_to_one
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
  }
  join: products {
    view_label: "Orders"
    relationship: many_to_one
    sql_on:   ${inventory_items.product_id} = ${products.id};;
  }
  join: derived_orders {
    view_label: "Orders"
    relationship: one_to_one
    sql_on: ${orders.id} = ${derived_orders.id} ;;
  }
  join: users {
    view_label: "Orders"
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users.id} ;;
  }
}
