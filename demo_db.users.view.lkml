view: demo_db_users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    group_label: "IDs"
    label: "User ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    hidden: no
    group_label: "User Info"
    label: "User Age"
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    hidden: no
    group_label: "User Location"
    label: "User City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    hidden: no
    group_label: "User Location"
    label: "User Country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    hidden: no
    label: "User Account Created Date"
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

  dimension: email {
    hidden: no
    group_label: "User Info"
    label: "User Email"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: name {
    hidden: no
    group_label: "User Info"
    label: "User Name"
    type: string
    sql: concat(${TABLE}.first_name,' ',${TABLE}.last_name) ;;
  }

  dimension: first_name {
    hidden: yes
    group_label: "User Info"
    label: "User First Name"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    hidden: no
    group_label: "User Info"
    label: "User Gender"
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    hidden: yes
    group_label: "User Info"
    label: "User First Name"
    type: string
    hidden: yes
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    hidden: no
    group_label: "User Location"
    label: "User State"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    hidden: no
    group_label: "User Location"
    label: "User Zip"
    type: zipcode
    sql: ${TABLE}.zip ;;
  }


}
