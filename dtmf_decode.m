function z= dtmf_decode(a)

clc
nfft1=length(a);

Fs=8000;
y=fftshift(fft(a));
dF=Fs/nfft1;
f=-Fs/2 : dF : Fs/2-dF;
% plot(f,abs(y));

index1=1;
index2=1;
 for i=1:1:length(y)
     
     if(abs(y(i))>200)
         index1=i;
%          disp(index1)
     
         break
     end
         
 end
 
 freq1=f(index1);
%   disp(freq1);                 

 for i=index1+1:1:length(y)
     
     if(f(i)>0 && abs(y(i))>500)
         
         index2=i;
%          disp(index2)
         break
     end
 end
 
 freq2=f(index2);
 
%  disp(freq1);                 
%  disp(freq2);
 
 z=1;
 
 if(abs(freq1)>1200 && abs(freq1)<1220 && freq2>690 && freq2<710)
          z='1';
 end
 
 if(abs(freq1)>1326 && abs(freq1)<1346 && freq2>690 && freq2<710)
          z='2';
 end
 
 if(abs(freq1)>1467 && abs(freq1)<1487 && freq2>690 && freq2<710)
          z='3';

 end
 
 if(abs(freq1)>1200 && abs(freq1)<1220 && freq2>760 && freq2<780)
          z='4';

 end
     
 if(abs(freq1)>1326 && abs(freq1)<1346 && freq2>760 && freq2<780)
          z='5';

 end
 
 if(abs(freq1)>1467 && abs(freq1)<1487 && freq2>760 && freq2<780)
          z='6';

 end
 
 if(abs(freq1)>1200 && abs(freq1)<1220 && freq2>842 && freq2<862)
          z='7';

 end
     
 if(abs(freq1)>1326 && abs(freq1)<1346 && freq2>842 && freq2<862)
          z='8';

 end
 
 if(abs(freq1)>1467 && abs(freq1)<1487 && freq2>842 && freq2<862)
          z='9';

 end
 
 if(abs(freq1)>1200 && abs(freq1)<1220 && freq2>931 && freq2<951)
          z='*';
          
 end
     
 if(abs(freq1)>1326 && abs(freq1)<1346 && freq2>931 && freq2<951)
          z='0';

 end
 
 if(abs(freq1)>1467 && abs(freq1)<1487 && freq2>931 && freq2<951)
          z='#';
 end
 
end