view: orders {
  derived_table: {
    sql:select
          *,
          ranked.rank as created_rank
        from orders
          # Rank orders on created_date by user
          inner join
            (select
              a.id as order_id,
              count(*) as rank
            from orders a
              inner join orders b
              on a.user_id = b.user_id and a.created_at >= b.created_at
            group by a.user_id, a.id) as ranked
          on orders.id = ranked.order_id;;
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

  dimension: created_rank {
    type:  number
    sql: ${TABLE}.created_rank ;;
  }



  ##############################
  #####      Measures      #####
  ##############################

  measure: total_orders {
    type: count
    drill_fields: [id]
  }

#   dimension: gross_prophet_margin {
#     type: number
#     sql: ${TABLE}.gross_prophet_margin ;;
#   }

#   measure: total_cost_of_order {
#     type: sum
#     sql: ${order_items.item_prophet_margin} ;;
#   }

#   measure: total_cost_of_order {
#     type: sum
#     sql: ${order_items.sale_price} ;;
#   }
#
#   measure: total_prophet_of_order {
#     type: sum
#     sql: ${order_items.item_prophet_margin} ;;
#   }

}
