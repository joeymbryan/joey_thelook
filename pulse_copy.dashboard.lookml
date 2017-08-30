- dashboard: pulse_copy
  title: Pulse Copy
  layout: newspaper
  elements:
  - name: Total Orders
    title: Total Orders
    model: joeys_project
    explore: demo_db_orders
    type: single_value
    fields:
    - demo_db_orders.total_orders
    sorts:
    - demo_db_orders.order_time desc
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Date: demo_db_orders.created_date
    row: 0
    col: 0
    width: 8
    height: 6
  - name: First Purchasers
    title: First Purchasers
    model: joeys_project
    explore: demo_db_orders
    type: single_value
    fields: [demo_db_orders.total_orders]
    filters:
      demo_db_orders.created_date: 90 days
      derived_orders.is_first_order: 'Yes'
    sorts: [demo_db_orders.total_orders desc]
    limit: 500
    column_limit: 50
    total: true
    query_timezone: America/Denver
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    row: 0
    col: 16
    width: 8
    height: 6
  - name: Sales By Date
    title: Sales By Date
    model: joeys_project
    explore: demo_db_orders
    type: looker_column
    fields:
    - demo_db_order_items.total_cost_of_order
    - demo_db_orders.created_date
    filters:
      demo_db_orders.created_date: 30 days
      demo_db_order_items.total_cost_of_order: NOT NULL
    sorts:
    - demo_db_orders.created_date desc
    limit: 500
    column_limit: 50
    total: true
    query_timezone: America/Denver
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types:
      calculation_1: line
    series_labels:
      calculation_1: Median
    show_dropoff: false
    hide_legend: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: Total Sales Price ($)
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 7
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: demo_db_order_items.total_cost_of_order
        name: Orders Total Cost of Order
    reference_lines:
    - reference_type: line
      line_value: median
      range_start: max
      range_end: min
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: right
      color: "#eb8c1e"
      label: Median
    - reference_type: range
      line_value: mean
      range_start: max
      range_end: mean
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: right
      color: "#bf6d0b"
      label: Above Average
    series_colors:
      demo_db_order_items.total_cost_of_order: "#784b9c"
    row: 6
    col: 12
    width: 12
    height: 9
  - name: Orders by Day and Category
    title: Orders by Day and Category
    model: joeys_project
    explore: demo_db_orders
    type: looker_area
    fields: [demo_db_orders.created_date, demo_db_products.category, demo_db_orders.total_orders]
    pivots: [demo_db_products.category]
    fill_fields: [demo_db_orders.created_date]
    filters:
      demo_db_products.category: Blazers & Jackets,Accessories,Fashion Hoodies & Sweatshirts,Pants,Shorts,Sweaters
      demo_db_orders.created_date: 90 days
    sorts: [demo_db_order.total_orders desc 0, demo_db_orders.created_date, demo_db_products.category]
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
    colors: ['palette: Santa Cruz']
    series_colors: {}
    y_axes: [{label: "# Orders", maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: Accessories,
            name: Accessories, __FILE: joeys_project/pulse_copy.dashboard.lookml, __LINE_NUM: 244},
          {id: Blazers & Jackets, name: Blazers &amp; Jackets, __FILE: joeys_project/pulse_copy.dashboard.lookml,
            __LINE_NUM: 246}, {id: Fashion Hoodies & Sweatshirts, name: Fashion Hoodies
              &amp; Sweatshirts, __FILE: joeys_project/pulse_copy.dashboard.lookml,
            __LINE_NUM: 248}, {id: Pants, name: Pants, __FILE: joeys_project/pulse_copy.dashboard.lookml,
            __LINE_NUM: 250}, {id: Shorts, name: Shorts, __FILE: joeys_project/pulse_copy.dashboard.lookml,
            __LINE_NUM: 252}, {id: Sweaters, name: Sweaters, __FILE: joeys_project/pulse_copy.dashboard.lookml,
            __LINE_NUM: 254}], __FILE: joeys_project/pulse_copy.dashboard.lookml, __LINE_NUM: 232}]
    x_axis_datetime_tick_count: 3
    series_labels: {}
    hide_legend: true
    row: 6
    col: 0
    width: 12
    height: 9
  - name: Top Zip Codes
    title: Top Zip Codes
    model: joeys_project
    explore: demo_db_orders
    type: looker_geo_coordinates
    fields:
    - demo_db_orders.total_orders
    - demo_db_users.zip
    filters:
      demo_db_orders.created_date: 90 days
    sorts:
    - demo_db_orders.total_orders desc
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron_nolabels
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 38.41055825094609
    map_longitude: -98.78906250000001
    map_zoom: 4
    series_types: {}
    point_radius: 3
    row: 15
    col: 0
    width: 12
    height: 8
  - name: Sales By State
    title: Sales By State
    model: joeys_project
    explore: demo_db_orders
    type: looker_geo_choropleth
    fields:
    - demo_db_orders.total_orders
    - demo_db_users.state
    filters:
      demo_db_orders.created_date: 90 days
    sorts:
    - demo_db_orders.total_orders desc
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron_nolabels
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 38.41055825094609
    map_longitude: -98.78906250000001
    map_zoom: 4
    series_types: {}
    point_radius: 3
    row: 15
    col: 12
    width: 12
    height: 8
  - name: Sales by Date and Category (Last 6 Weeks)
    title: Sales by Date and Category (Last 6 Weeks)
    model: joeys_project
    explore: demo_db_orders
    type: looker_donut_multiples
    fields:
    - demo_db_products.category
    - demo_db_orders.total_orders
    - demo_db_orders.created_week
    pivots:
    - demo_db_products.category
    filters:
      demo_db_products.category: Accessories,Blazers & Jackets,Active,Clothing Sets
      demo_db_orders.created_date: 7 weeks
      demo_db_orders.total_orders: NOT NULL
    sorts:
    - demo_db_products.category 0
    - demo_db_orders.created_week desc
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
    show_value_labels: true
    font_size: 11
    value_labels: legend
    label_type: labPer
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors: 'palette: Santa Cruz'
    series_colors: {}
    charts_across: 3
    hide_legend: false
    row: 23
    col: 0
    width: 12
    height: 7
  - name: Top 15 Brands
    title: Top 15 Brands
    model: joeys_project
    explore: demo_db_orders
    type: table
    fields:
    - demo_db_products.brand
    - demo_db_orders.total_orders
    - demo_db_order_items.total_cost_of_order
    - demo_db_order_items.average_cost_of_order
    filters:
      demo_db_orders.created_date: 90 days
    sorts:
    - demo_db_orders.total_orders desc
    limit: 15
    column_limit: 50
    query_timezone: America/Denver
    row: 23
    col: 12
    width: 12
    height: 7
  - name: Customer Cohort
    title: Customer Cohort
    model: joeys_project
    explore: demo_db_orders
    type: table
    fields:
    - demo_db_orders.created_month
    - demo_db_users.created_month
    - demo_db_orders.total_orders
    pivots:
    - demo_db_orders.created_month
    fill_fields:
    - demo_db_orders.created_month
    - demo_db_users.created_month
    filters:
      demo_db_orders.created_month: 13 months
      demo_db_users.created_month: 13 months
    sorts:
    - demo_db_users.created_month
    - demo_db_orders.created_month 0
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 38
    col: 0
    width: 24
    height: 8
  - name: Cohort - Orders Layered by Sign Up Month
    title: Cohort - Orders Layered by Sign Up Month
    model: joeys_project
    explore: demo_db_orders
    type: looker_area
    fields:
    - demo_db_orders.created_month
    - demo_db_orders.total_orders
    - demo_db_users.created_month
    pivots:
    - demo_db_users.created_month
    fill_fields:
    - demo_db_orders.created_month
    - demo_db_users.created_month
    filters:
      demo_db_orders.created_month: 13 months
      demo_db_users.created_month: 13 months
    sorts:
    - demo_db_orders.created_month desc
    - demo_db_users.created_month
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors:
    - 'palette: Tomato to Steel Blue'
    series_colors: {}
    y_axes:
    - label: Number of Orders
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: 2016-08
        name: 2016-08
      - id: 2016-09
        name: 2016-09
      - id: 2016-10
        name: 2016-10
      - id: 2016-11
        name: 2016-11
      - id: 2016-12
        name: 2016-12
      - id: 2017-01
        name: 2017-01
      - id: 2017-02
        name: 2017-02
      - id: 2017-03
        name: 2017-03
      - id: 2017-04
        name: 2017-04
      - id: 2017-05
        name: 2017-05
      - id: 2017-06
        name: 2017-06
      - id: 2017-07
        name: 2017-07
      - id: 2017-08
        name: 2017-08
    x_axis_label: Order Month
    row: 30
    col: 0
    width: 24
    height: 8
  - name: Average Prophet Per Order
    title: Average Prophet Per Order
    model: joeys_project
    explore: demo_db_orders
    type: single_value
    fields:
    - derived_avg_order_prophet.avg_prophet_margin_per_order
    sorts:
    - derived_avg_order_prophet.avg_prophet_margin_per_order
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 0
    col: 8
    width: 8
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    model: joeys_project
    explore: orders
    field: demo_db_orders.created_date
    listens_to_filters: []
    allow_multiple_values: true
