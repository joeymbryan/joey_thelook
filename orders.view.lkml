view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension_group: order {
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



  ##############################
  #####      Measures      #####
  ##############################

  measure: total_orders {
    type: count
    drill_fields: [id]
  }
}
