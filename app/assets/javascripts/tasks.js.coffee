# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# $(document() {
# 	# a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
# 	$( "#task-dialog:ui-dialog" ).dialog( "destroy" );

# 	var task = $( "#task" ),
# 		name = $( "#due_date" ),
# 		name = $( "#category" ),
# 		name = $( "#private" ),
# 		allFields = $( [] ).add( task ).add( due_date ).add( category ).add( private ),
# 		tips = $( ".validateTips" );

# 	function updateTips( t ) {
# 		tips
# 			.text( t )
# 			.addClass( "ui-state-highlight" );
# 		setTimeout(function() {
# 			tips.removeClass( "ui-state-highlight", 1500 );
# 		}, 500 );
# 	}

# 	$( "#task-dialog-form" ).dialog({
# 		autoOpen: false,
# 		height: 300,
# 		width: 350,
# 		modal: true,
# 		buttons: {
# 			"Create an account": function() {
# 				var bValid = true;
# 				allFields.removeClass( "ui-state-error" );
# 				if ( bValid ) {
# 					$( "#users tbody" ).append( "<tr>" +
# 						"<td>" + task.val() + "</td>" +
# 						"<td>" + due_date.val() + "</td>" +
# 						"<td>" + category.val() + "</td>" +
# 						"<td>" + private.val() + "</td>" +
# 					"</tr>" );
# 					$( this ).dialog( "close" );
# 				}
# 			},
# 			Cancel: function() {
# 				$( this ).dialog( "close" );
# 			}
# 		},
# 		close: function() {
# 			allFields.val( "" ).removeClass( "ui-state-error" );
# 		}
# 	});

# 	$( "#create-user" )
# 		.button()
# 		.click(function() {
# 			$( "#task-dialog-form" ).dialog( "open" );
# 		});
# });