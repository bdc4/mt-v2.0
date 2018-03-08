/// @description ease function

/// easing(ease,time,begin,end,duration)

/*
/*
 *
 * TERMS OF USE - EASING EQUATIONS
 * 
 * Open source under the BSD License. 
 * 
 * Copyright © 2001 Robert Penner
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.//
// 
// 
// Converted to GML by David Paiva, 2014
//  http://www.nailbuster.com/
//  
//
*/


var c,t,d,b,a,p;

if (EaseCurTime<=EaseDur)   //do if not finished
   {
    t = EaseCurTime;// current time
    b = EaseStart;// beginning value
    c = EaseEnd;// ending value
    d = EaseDur;// time duration


switch (EaseType) {

case 0:  //local function linear(t, b, c, d)
  EaseCurValue= (c * t / d) + b;
break;


case 1:  //local function inQuad(t, b, c, d)
  t = t / d
  EaseCurValue =  c * power(t, 2) + b;
break;

case 2:  //local function outQuad(t, b, c, d)
  t = t / d;
  EaseCurValue =  -c * t * (t - 2) + b;
break;

case 3:  //local function inOutQuad(t, b, c, d)
  t = t / d * 2;
  if t < 1 then {
    EaseCurValue =  c / 2 * power(t, 2) + b;
  } else {
    EaseCurValue =  -c / 2 * ((t - 1) * (t - 3) - 1) + b;
  }
break;

case 4:  //local function outInQuad(t, b, c, d)
  if t < d / 2 then {
    t=t*2;    c=c/2;   
      t = t / d;
      EaseCurValue =  -c * t * (t - 2) + b;
  } else {    
    t=(t * 2) - d;
    b= b + c / 2;
    c=c / 2;
      t = t / d;
      EaseCurValue =  c * power(t, 2) + b;
  }
break;

case 5:  //local function inCubic (t, b, c, d)
  t = t / d;
  EaseCurValue =  c * power(t, 3) + b;
break;

case 6:  //local function outCubic(t, b, c, d)
  t = t / d - 1;
  EaseCurValue =  c * (power(t, 3) + 1) + b;
break;

case 7:  //local function inOutCubic(t, b, c, d)
  t = t / d * 2;
  if t < 1 then {
    EaseCurValue =  c / 2 * t * t * t + b;
  } else {
    t = t - 2;
    EaseCurValue =  c / 2 * (t * t * t + 2) + b;
  }
break;

case 8:  //local function outInCubic(t, b, c, d)
  if t < d / 2 then {
    t=t * 2;c=c / 2;
      t = t / d - 1;
      EaseCurValue =  c * (power(t, 3) + 1) + b;
  } else {
    t=(t * 2) - d;b=b + c / 2;c=c / 2;
      t = t / d;
      EaseCurValue =  c * power(t, 3) + b;
  }
break;

case 9:  //local function inQuart(t, b, c, d)
  t = t / d;
  EaseCurValue =  c * power(t, 4) + b;
break;

case 10:  //local function outQuart(t, b, c, d)
  t = t / d - 1;
  EaseCurValue =  -c * (power(t, 4) - 1) + b;
break;

case 11:  //local function inOutQuart(t, b, c, d)
  t = t / d * 2;
  if t < 1 then {
    EaseCurValue =  c / 2 * power(t, 4) + b;
  } else {
    t = t - 2;
    EaseCurValue =  -c / 2 * (power(t, 4) - 2) + b;
  }
break;

case 12:  //local function outInQuart(t, b, c, d)
  if t < d / 2 then {
        t=t * 2;c=c / 2;
        t = t / d - 1;
        EaseCurValue =  -c * (power(t, 4) - 1) + b;
  } else {
     t=(t * 2) - d;b=b + c / 2;c=c / 2;
     t = t / d;
     EaseCurValue =  c * power(t, 4) + b;
  }
break;

case 13:  //local function inQuint(t, b, c, d)
  t = t / d;
  EaseCurValue =  c * power(t, 5) + b;
break;

case 14:  //local function outQuint(t, b, c, d)
  t = t / d - 1;
  EaseCurValue =  c * (power(t, 5) + 1) + b;
break;

case 15:  //local function inOutQuint(t, b, c, d)
  t = t / d * 2;
  if t < 1 then {
    EaseCurValue =  c / 2 * power(t, 5) + b;
  } else {
    t = t - 2;
    EaseCurValue =  c / 2 * (power(t, 5) + 2) + b;
  }
break;

case 16:  //local function outInQuint(t, b, c, d)
  if t < d / 2 then {
       t=t * 2;c=c / 2;
       t = t / d - 1;
       EaseCurValue =  c * (power(t, 5) + 1) + b;
  } else {
     t=(t * 2) - d;b=b + c / 2;c=c / 2;
     t = t / d;
     EaseCurValue =  c * power(t, 5) + b;
  }
break;

case 17:  //local function inSine(t, b, c, d)
  EaseCurValue =  -c * cos(t / d * (pi / 2)) + c + b;
break;

case 18:  //local function outSine(t, b, c, d)
  EaseCurValue =  c * sin(t / d * (pi / 2)) + b;
break;

case 19:  //local function inOutSine(t, b, c, d)
  EaseCurValue =  -c / 2 * (cos(pi * t / d) - 1) + b;
break;

case 20:  //local function outInSine(t, b, c, d)
  if t < d / 2 then {
    t=t * 2;c=c / 2; EaseCurValue =  c * sin(t / d * (pi / 2)) + b;
  } else {
    t=(t * 2) -d;b=b + c / 2;c=c / 2;
    EaseCurValue =  -c * cos(t / d * (pi / 2)) + c + b ;
  }
break;

case 21:  //local function inExpo(t, b, c, d)
  if t == 0 then {
    EaseCurValue =  b;
  } else {
    EaseCurValue =  c * power(2, 10 * (t / d - 1)) + b - c * 0.001;
  }
break;

case 22:  //local function outExpo(t, b, c, d)
  if t == d then {
    EaseCurValue =  b + c;
  } else {
    EaseCurValue =  c * 1.001 * (-power(2, -10 * t / d) + 1) + b;
  }
break;

case 23:  //local function inOutExpo(t, b, c, d)
  if t == 0 then { EaseCurValue =  b ;}
  if t == d then { EaseCurValue =  b + c ;}
  t = t / d * 2;
  if t < 1 then {
    EaseCurValue =  c / 2 * power(2, 10 * (t - 1)) + b - c * 0.0005;
  } else {
    t = t - 1;
    EaseCurValue =  c / 2 * 1.0005 * (-power(2, -10 * t) + 2) + b;
  }
break;

case 24:  //local function outInExpo(t, b, c, d)
  if t < d / 2 then {
    t=t * 2;c=c / 2;  if t == d then { EaseCurValue =  b + c;} else { EaseCurValue =  c * 1.001 * (-power(2, -10 * t / d) + 1) + b; }
  } else {
    t=(t * 2) - d;b=b + c / 2;c=c / 2;if t == 0 then { EaseCurValue =  b;} else { EaseCurValue =  c * power(2, 10 * (t / d - 1)) + b - c * 0.001;}
  }
break;

case 25:  //local function inCirc(t, b, c, d)
  t = t / d;
  EaseCurValue = (-c * (sqrt(1 - power(t, 2)) - 1) + b);
break;

case 26:  //local function outCirc(t, b, c, d)
  t = t / d - 1;
  EaseCurValue = (c * sqrt(1 - power(t, 2)) + b);
break;

case 27:  //local function inOutCirc(t, b, c, d)
  t = t / d * 2;
  if t < 1 then {
    EaseCurValue =  -c / 2 * (sqrt(1 - t * t) - 1) + b;
  } else {
    t = t - 2;
    EaseCurValue =  c / 2 * (sqrt(1 - t * t) + 1) + b;
  }
break;

case 28:  //local function outInCirc(t, b, c, d)
  if t < d / 2 then {
    t=t * 2;c=c / 2; 
    t = t / d - 1;
    EaseCurValue = (c * sqrt(1 - power(t, 2)) + b);
  } else {
    t=(t * 2) - d;b=b + c / 2;c=c / 2;
    t = t / d;
    EaseCurValue = (-c * (sqrt(1 - power(t, 2)) - 1) + b);
  }
break;

case 29:  //local function inElastic(t, b, c, d, a, p)
  if t == 0 then { EaseCurValue =  b }
  p=0;a=b;  

  t = t / d;

  if t == 1  then { EaseCurValue =  b + c; }

  if not p then { p = d * 0.3; }

  var s;

  if not a or a < abs(c) then {
    a = c;
    s = p / 4;
  } else {
    s = p / (2 * pi) * arcsin(c/a);
  }

  t = t - 1;

  EaseCurValue =  -(a * power(2, 10 * t) * sin((t * d - s) * (2 * pi) / p)) + b;
break;


case 30:  //local function outElastic(t, b, c, d, a, p)
  if t == 0 then { EaseCurValue =  b; }
  p=0;a=b;  

  t = t / d;

  if t == 1 then { EaseCurValue =  b + c; }

  if not p then { p = d * 0.3; }

  var s;

  if not a or a < abs(c) then {
    a = c;
    s = p / 4;
  } else {
    s = p / (2 * pi) * arcsin(c/a);
  }

  EaseCurValue =  a * power(2, -10 * t) * sin((t * d - s) * (2 * pi) / p) + c + b;
break;

//-- p = period
//-- a = amplitud

case 31:  //local function inOutElastic(t, b, c, d, a, p)
  if t == 0 then { EaseCurValue =  b ;}

  t = t / d * 2;

  if t == 2 then { EaseCurValue =  b + c; }
  p=0;a=b;  
  if not p then { p = d * (0.3 * 1.5); }
  if not a then { a = 0; }

  if not a or a < abs(c) then {
    a = c;
    s = p / 4;
  } else {
    s = p / (2 * pi) * arcsin(c / a);
  }

  if t < 1 then {
    t = t - 1;
    EaseCurValue =  -0.5 * (a * power(2, 10 * t) * sin((t * d - s) * (2 * pi) / p)) + b;
  } else {
    t = t - 1;
    EaseCurValue =  a * power(2, -10 * t) * sin((t * d - s) * (2 * pi) / p ) * 0.5 + c + b;
  }
break;

case 32:  //local function outInElastic(t, b, c, d, a, p)
  if t < d / 2 then {
    t=t * 2;c=c / 2;
            if t == 0 then { EaseCurValue =  b; break; }
            p=0;a=b;  
            t = t / d;
            if t == 1 then { EaseCurValue =  b + c; break;}
            if not p then { p = d * 0.3; }
            var s;
            if not a or a < abs(c) then {a = c; s = p / 4; } else {s = p / (2 * pi) * arcsin(c/a);}
            EaseCurValue =  a * power(2, -10 * t) * sin((t * d - s) * (2 * pi) / p) + c + b;
  } else {
    t=(t * 2) - d;b=b + c / 2;c=c / 2;
        if t == 0 then { EaseCurValue =  b;break; } p=0;a=b; 
        t = t / d;
        if t == 1  then { EaseCurValue =  b + c ; break;}
        if not p then { p = d * 0.3; }
        var s;
        if not a or a < abs(c) then {
        a = c;
        s = p / 4;
        } else {s = p / (2 * pi) * arcsin(c/a); }
        t = t - 1
        EaseCurValue =  -(a * power(2, 10 * t) * sin((t * d - s) * (2 * pi) / p)) + b;    
  }
break;

case 33:  //local function inBack(t, b, c, d, s)
  var s = 1.70158;
  t = t / d;
  EaseCurValue =  c * t * t * ((s + 1) * t - s) + b;
break;

case 34:  //local function outBack(t, b, c, d, s)
  var s = 1.70158;
  t = t / d - 1;
  EaseCurValue =  c * (t * t * ((s + 1) * t + s) + 1) + b;
break;

case 35:  //local function inOutBack(t, b, c, d, s)
  var s = 1.70158;
  s = s * 1.525;
  t = t / d * 2;
  if t < 1 then {
    EaseCurValue =  c / 2 * (t * t * ((s + 1) * t - s)) + b;
  } else {
    t = t - 2;
    EaseCurValue =  c / 2 * (t * t * ((s + 1) * t + s) + 2) + b;
  }
break;

case 36:  //local function outInBack(t, b, c, d, s)
  if t < d / 2 then {
    t=t * 2;c=c / 2;
    var s = 1.70158;
    t = t / d - 1;
    EaseCurValue =  c * (t * t * ((s + 1) * t + s) + 1) + b;
  } else {
    t=(t * 2) - d;b=b + c / 2;c=c / 2;
    var s = 1.70158;
    t = t / d;
    EaseCurValue =  c * t * t * ((s + 1) * t - s) + b;
  }
break;

case 37:  //local function outBounce(t, b, c, d)
  t = t / d;
  if t < 1 / 2.75 then {
    EaseCurValue =  c * (7.5625 * t * t) + b;
  } else if t < 2 / 2.75 then {
    t = t - (1.5 / 2.75);
    EaseCurValue =  c * (7.5625 * t * t + 0.75) + b;
  } else if t < 2.5 / 2.75 then {
    t = t - (2.25 / 2.75);
    EaseCurValue =  c * (7.5625 * t * t + 0.9375) + b;
  } else {
    t = t - (2.625 / 2.75);
    EaseCurValue =  c * (7.5625 * t * t + 0.984375) + b;
  }
break;

case 38:  //local function inBounce(t, b, c, d)
  t=d - t;b=0;
  t = t / d;
  if t < 1 / 2.75 then {
    EaseCurValue =  c * (7.5625 * t * t) + b;
  } else if t < 2 / 2.75 then {
    t = t - (1.5 / 2.75);
    EaseCurValue =  c * (7.5625 * t * t + 0.75) + b;
  } else if t < 2.5 / 2.75 then {
    t = t - (2.25 / 2.75);
    EaseCurValue =  c * (7.5625 * t * t + 0.9375) + b;
  } else {
    t = t - (2.625 / 2.75);
    EaseCurValue =  c * (7.5625 * t * t + 0.984375) + b;
  } 
  EaseCurValue=c-EaseCurValue+b;
break;

case 39:  //local function inOutBounce(t, b, c, d)
  if t < d / 2 then {
      t=t * 2;b=0;
      t=d - t;b=0;
      t = t / d;
        if t < 1 / 2.75 then {
         EaseCurValue =  c * (7.5625 * t * t) + b;
        } else if t < 2 / 2.75 then {
         t = t - (1.5 / 2.75);
         EaseCurValue =  c * (7.5625 * t * t + 0.75) + b;
        } else if t < 2.5 / 2.75 then {
        t = t - (2.25 / 2.75);
        EaseCurValue =  c * (7.5625 * t * t + 0.9375) + b;
        } else {
        t = t - (2.625 / 2.75);
         EaseCurValue =  c * (7.5625 * t * t + 0.984375) + b ;}
        EaseCurValue+=b;   
    EaseCurValue =  EaseCurValue * 0.5 + b;
  } else {
    t=t * 2 - d;b=0;
      t = t / d;
        if t < 1 / 2.75 then {
            EaseCurValue =  c * (7.5625 * t * t) + b;
           } else if t < 2 / 2.75 then {
            t = t - (1.5 / 2.75);
            EaseCurValue =  c * (7.5625 * t * t + 0.75) + b;
           } else if t < 2.5 / 2.75 then {
            t = t - (2.25 / 2.75);
            EaseCurValue =  c * (7.5625 * t * t + 0.9375) + b;
        } else { t = t - (2.625 / 2.75);
    EaseCurValue =  c * (7.5625 * t * t + 0.984375) + b; }            
    EaseCurValue =  EaseCurValue * 0.5 + c * 0.5 + b;

  }
break;

case 40:  //my own legacy ease movement one....
   var pw=power((c-b),(1/d));
   EaseCurValue=(c-b)-(power(pw,(d-t)));      
break;

default :  //local function linear(t, b, c, d)
          EaseCurValue= (c * t / d) + b;
          break;



} //switch;






/*
EaseCurValue =  {
  linear = linear,
  inQuad = inQuad,
  outQuad = outQuad,
  inOutQuad = inOutQuad,
  outInQuad = outInQuad,
  inCubic  = inCubic ,
  outCubic = outCubic,
  inOutCubic = inOutCubic,
  outInCubic = outInCubic,
  inQuart = inQuart,
  outQuart = outQuart,
  inOutQuart = inOutQuart,
  outInQuart = outInQuart,
  inQuint = inQuint,
  outQuint = outQuint,
  inOutQuint = inOutQuint,
  outInQuint = outInQuint,
  inSine = inSine,
  outSine = outSine,
  inOutSine = inOutSine,
  outInSine = outInSine,
  inExpo = inExpo,
  outExpo = outExpo,
  inOutExpo = inOutExpo,
  outInExpo = outInExpo,
  inCirc = inCirc,
  outCirc = outCirc,
  inOutCirc = inOutCirc,
  outInCirc = outInCirc,
  inElastic = inElastic,
  outElastic = outElastic,
  inOutElastic = inOutElastic,
  outInElastic = outInElastic,
  inBack = inBack,
  outBack = outBack,
  inOutBack = inOutBack,
  outInBack = outInBack,
  inBounce = inBounce,
  outBounce = outBounce,
  inOutBounce = inOutBounce,
}

*/
    


//if EaseCurTime>EaseDur 
//                           {EaseCurTime=0;
//                            EaseDone=true;
//                           } 

EaseCurTime +=1;

//if EaseCurTime>EaseDur+1     { //if EaseType==0 show_message(' time '+string(EaseCurTime)+' time '+string(EaseDur)+' time '+string(EaseCurValue));
//                             EaseDone=true;
//                           } 
                           


} else {EaseDone=true;}//if easedone=false;
                           





/* */
/*  */
