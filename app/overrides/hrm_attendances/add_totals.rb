Deface::Override.new(:virtual_path => "hrm_attendances/index", 
                     :name => "hrm_attendances_add_custom_totals",
					 :sequence => {:after => "hrm_attendances_totals_without_user"},
                     :insert_bottom => "dl.attendances-query-totals.query-totals",
                     :text => "
					 <% HrmAttendanceType.all.each do |item| %>
						<% if item.totalable? then %>
							<% attendeces_type = @query.results_scope(include: [:hrm_attendance_type, user: :hrm_user_type]).where(hrm_attendance_type_id: item.id) %>
							<% if item.input_format == 0 %><dt><%= item.name %></dt><dd class='value' title='<%= item.name %>'><%= format_hours(attendeces_type.sum('IF(#{HrmAttendance.table_name}.start_time IS NULL OR #{HrmAttendance.table_name}.end_time IS NULL, 0, (time_to_sec(timediff(#{HrmAttendance.table_name}.end_time, #{HrmAttendance.table_name}.start_time))))').fdiv(3600)) %></dd><% end %>
						<% end %>
					 <% end %>
					 ")