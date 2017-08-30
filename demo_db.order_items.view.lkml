view: order_items {
sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
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
    sql: round(( ${TABLE}.sale_price - ${inventory_items.cost} ),2) ;;
  }

#   dimension: gross_prophet_margin {
#     type: number
#     sql: round(${TABLE}.sale_price - ${inventory_items}.cost,2) ;;
#   }

  measure: total_items {
    type: count
  }

  measure: total_cost_of_order {
    type: sum
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  measure: average_cost_of_order {
    type: average
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  measure: total_prophet_of_order {
    type: sum
    sql: ${item_prophet_margin} ;;
    value_format_name: usd
  }
#
#   measure: average_prophet_of_order {
#     type: average
#     sql: ${TABLE}.item_prophet_margin ;;
#     value_format_name: usd
#   }
}
