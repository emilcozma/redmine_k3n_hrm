Deface::Override.new(:virtual_path => "issues/show", 
                     :name => "issues_show_remove_gravatar",
                     :replace => "div.gravatar-with-child",
                     :text => "")

Deface::Override.new(:virtual_path => "issues/show", 
                     :name => "issues_show_remove_subject",
					 :sequence => {:after => "issues_show_remove_gravatar"},
                     :replace => "div.subject",
                     :text => "	<div class='gravatar-subject-hrm-resources'>
									<div class='gravatar-subject-hrm-resources-item gravatar-subject'>
										<div class=\"gravatar-container\">
											<div class=\"gravatar-with-child\">
												<%= avatar(@issue.author, :size => \"50\", :title => l(:field_author)) %>
												<%= avatar(@issue.assigned_to, :size => \"22\", :class => \"gravatar gravatar-child\", :title => l(:field_assigned_to)) if @issue.assigned_to %>
											</div>
										</div>

										<div class=\"subject-container\">
											<div class=\"subject\">
												<%= render_issue_subject_with_tree(@issue) %>
											</div>
										</div>
									</div>
									<div class='gravatar-subject-hrm-resources-item'>
										<div class=\"hrm-resources-container\">
											<%= call_hook(:view_issues_show_hrm_resources, :issue => @issue) %>
										</div>
									</div>
								</div>
					 ")
