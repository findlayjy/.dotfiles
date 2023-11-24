$pdf_mode = 1;
$preview_continuous_mode = 1;
$pdf_previewer = 'open %O %S';
# $pdflatex = "xelatex %O %S";

# $ENV{'TEXINPUTS'}='$HOME/Dropbox/git/latex-templates;$HOME/Dropbox/tex-files//:' . $ENV{'TEXINPUTS'};
# $ENV{'BSTINPUTS'}='$HOME/Dropbox/git/latex-templates;$HOME/Dropbox/tex-files//:' . $ENV{'BSTINPUTS'};
# $ENV{'BIBINPUTS'}='$HOME/Dropbox/git/latex-templates;$HOME/Dropbox/tex-files//:' . $ENV{'BIBINPUTS'};

ensure_path( 'TEXINPUTS', '$HOME/Dropbox/git/latex-templates//', '$HOME/Dropbox/tex-files//' );
ensure_path( 'BSTINPUTS', '$HOME/Dropbox/git/latex-templates//', '$HOME/Dropbox/tex-files//' );
ensure_path( 'BIBINPUTS', '$HOME/Dropbox/git/latex-templates//', '$HOME/Dropbox/tex-files//' );
