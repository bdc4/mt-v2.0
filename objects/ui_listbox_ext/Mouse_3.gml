if uiHoverSelect==false exit;

if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;


var fx,numitems;

numitems=array_length_1d(items);
itemindex=-1;

for (fx=0;fx<numitems;fx+=1)
   if itemspos[fx]>(mouse_y-y-drawy) 
         { itemindex=fx;
           break;
         }  
if itemindex>numitems-1 then itemindex=numitems-1;
if itemindex<0 itemindex=0;

