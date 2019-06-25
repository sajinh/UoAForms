require File.join(File.dirname(__FILE__),"uoa_forms_module")
require 'erb'

class Form2

  def attachments
    {:cash_receipt => "Cash payments: Receipts (original)",
     :credit_card_receipt => "Credit card payments: copy of the relevant card bill (irrelevant
             sections may be blacked out)"
    }
  end
  def library_classification
   {:periodicals => "Periodicals etc. (Materials which do not fall under the category
                   \textquote{Durable Library Materials} above",
    :durable => "Durable Library Materials (Publications to be in use for at least one year)."
   }
  end
end

def form_handler(array, yml_fnm)
  form = Module.const_get("Form2").new
  infile = File.join(File.dirname(__FILE__),"form2.cls.erb")
  template = File.open(infile, 'rb', &:read)
  outfile =  File.basename(__FILE__, ".rb")+".cls"
  @library_classification = check_list(form.library_classification,
                                      array["library_classification"].to_sym)
  @funding_category = check_list(funding_category,
                                      array["funding_category"].to_sym)

  save_uoa_forms(ERB.new(template).result,outfile)
  make_form(array,yml_fnm)
end

def make_form(array,yml_fnm)
  user = array["user"]
  user.each { |name, value| instance_variable_set("@user_#{name}", value) }
  goods = array["goods"]
  goods.each { |name, value| instance_variable_set("@goods_#{name}", value) }
  @remarks = array["remarks"].to_sym if array["remarks"]
  infile = File.join(File.dirname(__FILE__),"form2.tex.erb")
  template = File.open(infile, 'rb', &:read)
  outfile =  "#{yml_fnm}.tex"
  save_uoa_forms(ERB.new(template).result,outfile)
  compile(outfile)
end
