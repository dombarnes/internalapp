// ...
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function() {
$("#datepicker").datepicker();
$("#companies th a, #companies .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
});
$("#companies_search input").keyup(function() {
    $.get($("#companies_search").attr("action"), $("#companies_search").serialize(), null, "script");
    return false;
});

$("#dialog-confirm")
	.click(function() {
		$("#dialog").dialog("destroy");
});

$(document).ready(function() {
  $('#create_invoice').click(function(e) {
    var url = $(this).attr('href');
    var dialog_form = $('<div id="dialog-form">Loading form...</div>').dialog({
      autoOpen: false,
      width: 520,
      modal: true,
      open: function() {
        return $(this).load(url + ' #content');
      }
    });
    dialog_form.dialog('open');
    e.preventDefault();
  });
});

$("#dialog-modal").dialog();

$("#dialog-form").dialog({
	autoOpen: false,
	height: 350,
	width: 500,
	modal: true,
	buttons: {
		"Save values": function() {
			var bValid = true;
			var allFields = $([]).add(daily_rate).add(iosdevice_install_setup).add(iosdevice_support_cost).add(iosdevice_install_time);
			container = $('div.container');
			allFields.val('').removeClass( "ui-state-error" );
			if ( bValid ) {
				$( "#ios_values tbody" ).append( "<tr>" +
					"<td>" + daily_rate.val() + "</td>" +
					"<td>" + iosdevices_install_setup.val() + "</td>" +
					"<td>" + iosdevices_support_cost.val() + "</td>" +
					"<td>" + iosdevices_install_time.val() + "</td>" +
				"</tr>" );
				$( this ).dialog( "close" );
			}
		},
		Cancel: function() {
			$( this ).dialog( "close" );
		}
	},
	close: function() {
		allFields.val( "" ).removeClass( "ui-state-error" );
	}
});

$("#create-ios-value")
		.button()
		.click(function() {
			$( "#dialog-form" ).dialog( "open" );
		});
});
});
