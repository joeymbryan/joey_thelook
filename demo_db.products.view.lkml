view: demo_db_products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    hidden: no
    group_label: "Product Info"
    label: "Product Brand"
    description: "The Brand which created the product"
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    hidden: no
    group_label: "Product Info"
    label: "Category"
    description: "What type of product it is."
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    hidden: no
    group_label: "Product Info"
    label: "Department"
    description: "Which department of the store sells this product"
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    hidden: no
    group_label: "Product Info"
    label: "Name"
    description: "name of the product"
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: retail_price {
    hidden: no
    group_label: "Product Info"
    label: "Retail Price"
    description: "How much the product is sold for"
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    hidden: yes
    type: string
    sql: ${TABLE}.sku ;;
  }
}
