view: orders {
  derived_table: {
    sql:select
          orders.id as id,
          orders.created_at as created_at,
          orders.status as status,
          orders.user_id as user_id,
          round(sum(order_items.sale_price),2) as total_cost_of_order,
          round(sum(a.gross_prophet_margin_on_item),2) as gross_prophet_margin
        from
          orders
          left join demo_db.order_items on orders.id = order_items.order_id
          left join
            (select
              order_items.order_id as order_id,
              products.item_name,
              inventory_items.cost as "item_cost",
              order_items.sale_price as "item_sale_price",
              round(( order_items.sale_price - inventory_items.cost ),2) as "gross_prophet_margin_on_item"
            from
              order_items
              left join demo_db.inventory_items on order_items.inventory_item_id = inventory_items.id
              left join demo_db.products on order_items.id = products.id) as a
            on a.order_id = orders.id
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

  dimension: gross_prophet_margin {
    type: number
    sql: ${TABLE}.gross_prophet_margin ;;
  }


  ##############################
  #####      Measures      #####
  ##############################

  measure: total_orders {
    type: count
    drill_fields: [id]
  }
}
