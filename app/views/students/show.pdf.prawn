require 'prawn-table'
pdf.text "Schueler", :size => 15
pdf.text "\r\n"
pdf.text "Name: #{@student.full_name}"
pdf.text "Klasse: #{@student.classname.full_name}"
price = 0;


@student.copies.each do |copy|
    price += copy.book.price if copy.topay;
end

pdf.text "Offene Gebuehren: #{price} Euro"
pdf.text "\r\n"

pdf.text "Buecher", :size => 15
pdf.text "\r\n"
pdf.text "Derzeit keine Buecher ausgeliehen" if !@student.copies.present?;



@student.copies.to_ary.each do |copy|
pdf.text "#{copy.code}: #{copy.book.label}";
end