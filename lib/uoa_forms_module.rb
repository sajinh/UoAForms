require 'fileutils'
def uoa_forms_dir
  #File.join(File.dirname(__FILE__),"UoA_Forms")
  File.join(ENV["PWD"],"TeX")
end

def save_uoa_forms(data,fname)
  FileUtils.mkdir_p(uoa_forms_dir)
  fout = File.open(File.join(uoa_forms_dir,fname), "w") 
  fout.write(data)
  fout.flush
  fout.close
end

def check_list(list_hash,check_item)
  array = []
  list_hash.each do |key,value|
    
    if key==check_item
      array << '\rule{2.4ex}{2.4ex}\ '+value
    else
      array << '\fbox{\phantom{\rule{0.6ex}{0.6ex}}} '+value
    end
  end
  array
end

def compile(fname)
  ofnm = "#{File.basename(fname,".tex")}.pdf"
  Dir.chdir(uoa_forms_dir) do
    puts `xelatex #{fname}`
    FileUtils.mv(ofnm,ENV["PWD"])
  end
end
