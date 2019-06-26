require File.join(File.dirname(__FILE__),"uoa_forms_module")
require 'erb'

class Form3

  def payment_types
    {:toll => "1. Toll-road fares", 
     :parking => "2. Parking fees",
     :rental_car => "3. Car rental and fuel for rental car",
     :takyubin => "4. Package-delivery services",
     :photo => "5. Photo processing costs",
     :printing => "6. Copying and printing",
     :training_fee => "7. Attendance fees for training sessions, workshops, etc.",
     :conference_fee => "8. Entrance fees and registration fees for attendance at
                         academic conferences, international conferences, etc.",
     :honorarium => "9. Honorariums (Only for cases where immediate payment is
                     necessary.)",
     :book_store => "10. Books for which immediate payment at a store is confirmed as necessary",
     :online_store => "11. Books and/or items costing less than JPY 100,000 per order
                       purchased online for which payment is restricted to credit cards",
     :misc => "12. Purchase of items or books which cost JPY 100,000 or less per order
               (limited to cases where post-purchase payment via purchase bill is difficult)",
     :foreign_creditors => "13. Payment for foreign creditors",
     :inevitable => "14. Disbursements inevitable for business purposes at locations during
                       business trips",
     :exceptional => "15. Expenses recognized as exceptionally necessary by the Chairperson of
                      the Board of Executives"
     }
  end
  def library_classification
   {:periodicals => "Periodicals etc. (Materials which do not fall under the category
                   \textquote{Durable Library Materials} above",
    :durable => "Durable Library Materials (Publications to be in use for at least one year)."
   }
  end
  def attachments
    {:cash_receipt => "Cash payments: Receipts (original)",
     :credit_card_receipt => "Credit card payments: copy of the relevant card bill (irrelevant
             sections may be blacked out)"
    }
  end
end

def form_handler(array, yml_fnm)
  form = Module.const_get("Form3").new
  infile = File.join(File.dirname(__FILE__),"form3.cls.erb")
  template = File.open(infile, 'rb', &:read)
  # ---------------------
  # @payment_type, @attachments, @library_classification
  # is needed to customize the template
  # ---------------------
  @payment_type = form.payment_types[array["payment"]["type"].to_sym]
  @attachments = check_list(form.attachments,array["attachments"].to_sym)
  @library_classification = check_list(form.library_classification,
                                      array["library_classification"].to_sym)
  outfile =  File.basename(__FILE__, ".rb")+".cls"
  save_uoa_forms(ERB.new(template).result,outfile)
  make_form(array,yml_fnm)
end

def make_form(array,yml_fnm)
  user = array["user"]
  user.each { |name, value| instance_variable_set("@user_#{name}", value) }
  payment = array["payment"]
  payment.each { |name, value| instance_variable_set("@payment_#{name}", value) }
  goods = array["goods"]
  goods.each { |name, value| instance_variable_set("@goods_#{name}", value) }
  @remarks = array["remarks"].to_sym if array["remarks"]
  infile = File.join(File.dirname(__FILE__),"form3.tex.erb")
  template = File.open(infile, 'rb', &:read)
  outfile =  "#{yml_fnm}.tex"
  save_uoa_forms(ERB.new(template).result,outfile)
  compile(outfile)
end
