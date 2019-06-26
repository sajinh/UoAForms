# Introduction

This project provides LaTeX templates to help create some forms that aid you in managing
you grants. LaTeX classes are provided, so that the user need only enter the data needed
for each form. The LaTeX classes take care of formatting tables and other entries.
See directory TeX for examples of templates (.cls files) and the data files 
(these are provided using regular .tex files).

Some forms need to be customized, for example you may need to check list certain entries.
I gave up on doing this using LaTeX alone. Instead, I have used ruby to help me manage these.
To provide data to my ruby scripts, I use the yml data format. The files ending with .yml are
YML (or YAML) data files. 

A ruby script uoa_forms.rb customizes the LaTeX templates, consume data from the .yml files
and create the required form in pdf format for printing.

## How to use the executable

The executable is in the bin directory, as usual. It is called uoa_forms.rb.  After cloning, you
may need to `chmod 755 bin/uoa_forms.rb`. You can also invoke this using `ruby bin/uoa_forms.rb` 

This executable needs one argument, the name of the
"YAML" file containing your form data (in yml format). See conf_fee.yml and printer.yml for
examples.  The comments are deliberately made long just for your entertainment.

Try making Form2 using `bin/uoa_forms.rb printer.yml`
