view: derived_avg_order_prophet {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: select
          round(sum(sale_price - inventory_items.cost) / count(distinct order_id),2) as avg_prophet_margin_per_order
        from order_items
          inner join demo_db.inventory_items inventory_items on
          order_items.inventory_item_id = inventory_items.id
      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: avg_prophet_margin_per_order {
    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.avg_prophet_margin_per_order ;;
  }
}
