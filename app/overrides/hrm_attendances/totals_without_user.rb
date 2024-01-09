Deface::Override.new(:virtual_path => "hrm_attendances/index", 
                     :name => "hrm_attendances_totals_without_user",
                     :insert_before => "erb[loud]:contains(\"::Temple::Utils.escape_html_safe((render partial: 'list', locals: { show_edit_actions: true }))\")",
                     :text => "
					 <% if !@with_totals then %>
						<dl class='attendances-query-totals query-totals'></dl>
					 <% end %>
					 ")