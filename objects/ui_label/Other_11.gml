/// @description break apart memo string
var curx,curword, curline, curst,fx,lh;

draw_set_font(uiFont);

curx = 0;
curst=uiTextValue;
curword="";
curline="";
fx=1;
items=0;  //reset items array
drawy=0;  //reset top pos
lastchar="";
while string_length(curst)>fx
 {
 linebreak=false;
 //grab a word (repeat until ' ');
 curchar=string_char_at(curst,fx);
  while 1
     { 
       if (curchar != " ") && (curchar != chr(13)) && (curchar != chr(10)) && (curchar != "#")
           {curword = curword + curchar;}
       fx=fx+1;
       if fx>string_length(curst) break;
       lastchar=curchar;
       curchar=string_char_at(curst,fx);       
       if (curchar== chr(10)) 
                           {  linebreak=true;                                  
                              break;
                           }                                                                                                 
       if (curchar== "#") {  if (lastchar != "\\") {
                                                    linebreak=true;
                                                    break;
                                                  } 
                             else curword =curword+"#";
                          }   
       if (curchar==" ") break;                              
                                                
     }
  curword=curword+" ";
     
  if ((string_width(string_hash_to_newline(curline))+string_width(string_hash_to_newline(" "+curword)))*uiXscale<sprite_width -3)
    {curline=curline+curword;
     curword="";
    }  
    else {  //if line too long we append and create new string.
          items[curx]=curline;
          curx=curx+1;
          curline=curword;
         }
    
  if linebreak  //if chr(10) or '#'
    {
     items[curx]=curline;
     curx=curx+1;
     curline="";
    }
  curword="";            
 }
 
if curline !="" {items[curx]=curline;}

numitems=array_length_1d(items);

if numitems>1 multLines=true else multLines=false;

lh=(string_height(string_hash_to_newline("XgpT"))*uiYscale);   //lineheight;
uiCurHeight=(numitems * (lh+uiLineSpacing)) + 5;  //info only for other controls.








