view: demo_db_order_items {
sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    hidden: yes
    group_label: "Inventory Item"
    label: "Inventory Item ID"
    description: "ID of individual item in inventory"
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    hidden: yes
    group_label: "First / Most Recent Order"
    label: "First"
    description: "This is the first order the user ever made"
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: item_returned {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: item_prophet_margin {
    type: number
    sql: round(( ${sale_price} - ${demo_db_inventory_items.cost} ),2) ;;
  }



  ##############################
  #####      Measures      #####
  ##############################

  measure: total_cost_of_order {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: average_cost_of_order {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: total_prophet_of_order {
    type: sum
    sql: ${item_prophet_margin} ;;
    value_format_name: usd
  }
}
