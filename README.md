# PL

Owner of project : Ömer Özkılıç
Name of the programming language : Lan
BNF "
  <function> ::= <function> <stmt>       
        |

  <stmt> ::=
        | ';'
        | <expr>                        
        | <PRINT> <expr>                  
        | <EXIT>                        
        | <BIN> <VARIABLE> '=' <expr>       
        | <WHILE> '(' <expr> ')' <stmt>        
        | <IF> '(' <expr> ')' <stmt> 
        | <IF> '(' <expr> ')' <stmt> <ELSE> <stmt> 
        | '{' <stmtlist> '}'              

  <stmtlist> ::=
          <stmt>                  { }
        | <stmtlist> <stmt>        {  }
        ;

  <expr> ::=
          <INTEGER>              
        | <VARIABLE>             
        | '-' <expr> 
        | <expr> '+' <expr>         
        | <expr> '-' <expr>        
        | <expr> '*' <expr>        
        | <expr> '/' <expr>      
        | <expr> '<' <expr>        
        | <expr> '>' <expr>         
        | <expr> '>=' <expr>          
        | <expr> '<=' <expr>         
        | <expr> '!=' <expr>          
        | <expr> '==' expr>          
        | <expr> '||' <expr>        
        | <expr> '&&' <expr>        
        | '(' <expr> ')'          
  "
