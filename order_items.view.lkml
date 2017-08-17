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
    hidden: yes
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

#   dimension: gross_prophet_margin {
#     type: number
#     sql: round(${TABLE}.sale_price - ${inventory_items}.cost,2) ;;
#   }

  measure: total_order_items {
    type: count
    drill_fields: [id]
  }
}
