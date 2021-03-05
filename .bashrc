orange=$(tput setaf 166);
yellow=$(tput setaf 228);
red=$(tput setaf 160);
white=$(tput setaf 15);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${orange}\]\u"; # username
PS1+="\[${white}\] at ";
PS1+="\[${yellow}\]\h"; # host
PS1+="\[${white}\] in ";
PS1+="\[${red}\]\W"; # working directory
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # '$' and reset

export PS1;
