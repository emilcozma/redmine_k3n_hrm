Deface::Override.new(:virtual_path => "hrm_attendance_types/_form", 
                     :name => "hrm_attendance_types_add_totalable_checkbox",
                     :insert_after => "div.box.tabular > p:nth-child(3)",
                     :text => '<p><%= f.check_box :totalable %></p>')