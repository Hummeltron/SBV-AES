
pdf.text "Klasse", :size => 15
pdf.text "\r\n"
pdf.text "Name: #{@classname.name}"
pdf.text "Jahr: #{@classname.year}"


pdf.text "\r\n"

pdf.text "Buecher", :size => 15
pdf.text "\r\n"
pdf.text "Derzeit keine Buecher ausgeliehen" if !@student.copies.present?;



@student.copies.to_ary.each do |copy|
pdf.text "#{copy.code}: #{copy.book.label}";
end