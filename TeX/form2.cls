\ProvidesClass{uoa-form3}[2018/10/09 form class]
\NeedsTeXFormat{LaTeX2e}

\LoadClass{article}

\RequirePackage{xeCJK}
\setCJKmainfont{mikachan-P}
\RequirePackage{csquotes}
\RequirePackage{tabu}
\RequirePackage{multirow}
\RequirePackage{tikz}
\RequirePackage{amssymb}
\RequirePackage{tcolorbox}
\RequirePackage{parskip}
\pagestyle{empty}
\setlength{\tabcolsep}{2pt}
\RequirePackage[left=2.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}


\newcommand{\gydfnt}{}
\newcommand{\entfnt}[1]{\textsf{\textbf{#1}}}
\newcommand\crule[3][black]{\textcolor{#1}{\rule{#2}{#3}}}
\newcommand{\high}[1]{\ensuremath{^{#1}}}
\newcommand{\degree}{\high{\circ}}
\newcommand{\norm}[1]{\lvert #1 \rvert}
\newcommand{\prim}[1]{#1\high{\prime}}



%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\newcommand{\remarks}{
  \textbf{Remarks}
  \begin{enumerate}
   \item Attach documents dealing with your business and itinerary. For your
     conference presentations, attach your paper or an abstract.
  \item When conducting a research meeting, enter the names, positions, and
    affiliations of the other parties.
  \item Circle the applicable method(s) of transportation. When using highway buses, or air travel, enter the intervals in which you will use them. For air travel, also attach documents showing the details of your reservations.
  \end{enumerate}

}

\newcommand{\sealbox}{
  \textbf{Form 2} (For Faculty Members)\\
  %\hspace*{1ex}\hfill
  \begin{center}
    \textbf{\large Purchase Order Record}
   \end{center}
}

\newcommand{\appdetails}[4]{%
  \begin{center}
    Date of submission: \entfnt{#1} \\ 
  \end{center}
\begin{enumerate}
  \item \gydfnt{Name}\hspace*{2ex}  \entfnt{#2} \hspace*{2ex} \gydfnt{Seal}\hspace*{2ex}  \gydfnt{Ext:} \entfnt{#3}
  \item \gydfnt{Date of Order}\hspace*{6ex}  \entfnt{#4} \hspace*{6ex} Place for Delivery:
  \item \gydfnt{Ordering Process (Please check the applicable box)}
\end{enumerate}
\hspace*{6ex}\\
\hspace*{6ex} {\small \crule{3ex}{3ex}} 
\gydfnt{Receipt of estimates (please attach copies of relevant estimates.})\\
\\
\hspace*{6ex}
{\small  \fbox{\phantom{c}}} 
\gydfnt{E-mail or online order (please attach a copy of the order form.})\\
\\
\hspace*{6ex}
{\small  \fbox{\phantom{c}}} 
\gydfnt{FAX order (please attach a copy of the fax transmittal.})\\
\\
\hspace*{6ex}
{\small  \fbox{\phantom{c}}} 
\gydfnt{Phone order (please fill in the following section. If estimates have already been
received, please attach relevant estimates and enter \textquote{see the attached
estimates}.})\\
\textbf{\high{*} In case of an order by phone, please fill in the following section.}
\\
  \begin{tabu} to 1.0\textwidth{|X|X|X|X|}
\hline
\gydfnt{Name, Specifications and Maker} &\gydfnt{Quantity} &\gydfnt{Price (tax included)} &\gydfnt{Vendor}\\
&&&\\
\hline
&&&\\
\hline
&&&\\
\hline
Total &&&\\
\hline
  \end{tabu}
}

\newenvironment{misc}{%
}

\newcommand{\miscbudget}[2]{
\textbf{4. Budget Sources (Please check the applicable box )}\hfill\fbox{Theme No.}\fbox{\entfnt{#1}} 
\\
Planning and Collaboration Division-Managed Budgets

\fbox{\phantom{\rule{0.6ex}{0.6ex}}} Regular Research (R) \fbox{\phantom{\rule{0.6ex}{0.6ex}}} Graduate School Research (G) \fbox{\phantom{\rule{0.6ex}{0.6ex}}} Competitive Research Funding (P) \fbox{\phantom{\rule{0.6ex}{0.6ex}}} Collaborative Research (A) \fbox{\phantom{\rule{0.6ex}{0.6ex}}} Commissioned Research (B) \rule{2.4ex}{2.4ex}\ Grant/Donation (C/E) \fbox{\phantom{\rule{0.6ex}{0.6ex}}} Research Subsidy from Fukushima Foundation (F) \fbox{\phantom{\rule{0.6ex}{0.6ex}}} Grant-In-Aid for Scientific Research (H)
\\

\textbf{5. Library Material Classification (Please check the relevant box if applicable.)}
\\
\small

    \fbox{\phantom{\rule{0.6ex}{0.6ex}}} Periodicals etc. (Materials which do not fall under the category
                   \textquote{Durable Library Materials} above\\
  
    \fbox{\phantom{\rule{0.6ex}{0.6ex}}} Durable Library Materials (Publications to be in use for at least one year).\\
  

\textbf{[Notes]}
\begin{enumerate}
  \item  Please submit this form to the Planning and Collaboration Division right after placing an order.
  \item  As payments to vendors must be made by the 25th day (28th for Kakenhi payments) of the month after delivery, please submit relevant statements of delivery and invoices by the 5th day of the month after delivery.
  \item  Please be sure to classify ordered publications either as “Durable Library Materials” or “Periodicals, etc.”
  \item  Splitting one order into multiple orders is against our accounting rules and is prohibited.
\end{enumerate}
Remarks: \entfnt{#2}

}

