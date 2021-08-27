function w_array = euler(f,a,b,h,w0)
 w_array=[];
 w=w0;
 %n =  (b-a)/h
 %ti=a:h:b
 %n=length(ti)
 for i =a:h:b
     w= w+h*f(i,w);
     w_array=[w_array w];
 end
end