logopath = "#{RAILS_ROOT}/public/images/logo.jpg"

pdf.image logopath, :width => 110, :height => 37
pdf.move_down 70
pdf.font "Helvetica"
pdf.font_size 18
pdf.text_box "iOS Quote for #{@ios_quote.customer}", :align => :right

pdf.font_size 22
pdf.text "Thank you for your order, #{@invoice.customer_name}.", :align => :center
pdf.move_down 20

pdf.font_size 14
pdf.text "Below you can find your order details.", :alighn => :left

invoiceinfo = [["Customer Name", "#{@ios_quote.customer}"], ["Device Quantity", "#{@ios_quote.device_quantity}"],["Total Cost", "#{@invoice.install_cost}"],["Support Cost", "#{@ios_quote.support_cost}"]]

pdf.move_down 30

pdf.table invoiceinfo,
:border_style => :grid,
:font_size => 11,
:position => :center,
:column_widths => { 0 => 150, 1 => 250},
:align => { 0 => :right, 1 => :left, 2 => :right, 3 => :left},
:row_colors => ["d2e3ed", "FFFFFF"]

pdf.font_size 14

pdf.bounding_box([pdf.bounds.right - 50,pdf.bounds.bottom], :width => 60, :height => 20) do
pagecount = pdf.page_count
pdf.text "Page #{pagecount}"
end