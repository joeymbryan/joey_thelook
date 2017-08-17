view: orders {
  derived_table: {
    sql:select
          orders.id as id,
          orders.created_at as created_at,
          orders.status as status,
          orders.user_id as user_id,
          round(sum(order_items.sale_price),2) as total_cost_of_order
        from
          orders
          left join demo_db.order_items on orders.id = order_items.order_id
        where
          order_items.returned_at is null
        group by id ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  dimension: total_cost_of_order {
    type: number
    sql: ${TABLE}.total_cost_of_order ;;
  }



  ##############################
  #####      Measures      #####
  ##############################

  measure: total_orders {
    type: count
    drill_fields: [id]
  }
}
