pdf = Prawn::Document.new	
		

pdf.move_down 150
pdf.font "Helvetica"
pdf.font_size 18
pdf.text "iOS Quote for #{@ios_quote.customer}", :align => :right
pdf.move_down 2
pdf.font_size 14
pdf.text "Produced by #{current_user.first_name + " " + current_user.last_name}", :align => :right

pdf.move_down 50
pdf.font_size 14
pdf.text "Below you can find your quote details.", :align => :left
pdf.move_down 20

quoteinfo = [["Customer Name", "#{@ios_quote.customer}"], ["Device Quantity", "#{@ios_quote.device_quantity}"],["Installation Cost", "#{number_to_currency(@ios_quote.install_cost, :unit => "£")}"],["Support Cost", "#{number_to_currency(@ios_quote.support_cost, :unit => "£")}"]]
pdf.table quoteinfo, :width => 300, :row_colors => ["C3cddf", "DDDDDD"]

pdf.move_down 30
pdf.text "MacByte Support includes the following:"
pdf.text "• Unlimited Telephone Support (Mon-Fri 9am-5pm ex Bank Holidays) "
pdf.font_size 14
pdf.text "• Unlimited email support"
pdf.text "• Unlimited remote support (subject to access)"

pdf.move_down 10
pdf.text "Standard Installation includes device activation, update to latest version of iOS, joining to wifi network, "

pdf.font_size 10
pdf.bounding_box([pdf.bounds.left + 10,pdf.bounds.bottom + 50], :width => 500, :height => 60) do
	pdf.text_box "* All quotes are valid for 30 days. Please contact your us for a revised quote if this has expired.", 
end

pdf.bounding_box([pdf.bounds.right - 50,pdf.bounds.bottom], :width => 60, :height => 20) do
	pagecount = pdf.page_count
	pdf.text "Page #{pagecount}"
end
pdf.bounding_box([pdf.bounds.left - 20,pdf.bounds.bottom], :width => 100, :height => 20) do
	pdf.text "Date #{Time.now.strftime("%d/%m/%y")}"
end