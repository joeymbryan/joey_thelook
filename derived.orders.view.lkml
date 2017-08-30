view: derived_orders {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: select
          id,
          rank_asc as created_rank_first,
          rank_desc as created_rank_last
        from orders
          # Rank orders on created_date from earliest to latest by user
          inner join
            (select
              a.id as order_id,
              count(*) as rank_asc
            from orders a
              inner join orders b
              on a.user_id = b.user_id and a.created_at >= b.created_at
            group by a.user_id, a.id) as ranked_asc
          on orders.id = ranked_asc.order_id
          # Rank orders on created_date from latest to earliest by user
          inner join
            (select
              a.id as order_id,
              count(*) as rank_desc
            from orders a
              inner join orders b
              on a.user_id = b.user_id and a.created_at <= b.created_at
            group by a.user_id, a.id
            order by a.created_at desc) as ranked_desc
          on orders.id = ranked_desc.order_id
      ;;
  }

  dimension: id {
    hidden: yes
    group_label: "IDs"
    label: "Order ID"
    description: "This is the Order ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: created_rank_first {
    hidden: no
    group_label: "Created Date Rank"
    label: "First"
    description: "This ranks the order from frist to last created_date grouped by user"
    type: number
    sql: ${TABLE}.created_rank_first ;;
  }

  dimension: created_rank_last {
    hidden: no
    group_label: "Created Date Rank"
    label: "Last"
    description: "This ranks the order from last to first created_date grouped by user"
    type: number
    sql: ${TABLE}.created_rank_last ;;
  }

  dimension: is_first_order {
    hidden: no
    group_label: "First / Most Recent Order"
    label: "First"
    description: "This is the first order the user ever made"
    type: yesno
    sql: ${created_rank_first} = 1 ;;
  }

  dimension: is_most_recent_order {
    hidden: no
    group_label: "First / Most Recent Order"
    label: "Most Recent"
    description: "This is the most recent order the user ever made"
    type: yesno
    sql: ${created_rank_last} = 1 ;;
  }

}
